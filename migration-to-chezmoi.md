# Migration from install.sh to chezmoi

## Current Setup
Your dotfiles are managed by `install.sh` which:
1. Installs starship
2. Creates symlinks for:
   - `starship.toml` → `~/.config/starship.toml`
   - `.zshrc` → `~/.zshrc`
   - `.gitconfig` → `~/.gitconfig`

## Migration Steps

### 1. Install chezmoi
```bash
# Install chezmoi (choose one method)
sh -c "$(curl -fsL get.chezmoi.io)"
# OR if you have Go:
go install github.com/twpayne/chezmoi/v2@latest
# OR download binary directly:
curl -LO https://github.com/twpayne/chezmoi/releases/latest/download/chezmoi-linux-amd64
chmod +x chezmoi-linux-amd64
sudo mv chezmoi-linux-amd64 /usr/local/bin/chezmoi
```

### 2. Initialize chezmoi with your existing repo
```bash
# Initialize chezmoi using your existing dotfiles repo
chezmoi init --apply=false https://github.com/friggeri/dotfiles.git

# OR if in devcontainer (already mounted at correct location):
chezmoi init --apply=false
```

### 3. Restructure files for chezmoi
Chezmoi uses a specific naming convention. Rename your files in the repo:

```bash
# If in devcontainer, you're already in the right directory
cd ~/.local/share/chezmoi
# Otherwise:
cd /path/to/your/dotfiles

# Rename files with chezmoi naming convention
mkdir -p dot_config
mv starship.toml dot_config/starship.toml
mv .zshrc dot_zshrc
mv .gitconfig dot_gitconfig

# Create a run_once script for starship installation
cat > run_once_install-starship.sh << 'EOF'
#!/bin/sh
# This script runs only once, even if you run chezmoi apply multiple times
if ! command -v starship >/dev/null 2>&1; then
    echo "Installing starship..."
    sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes
fi
EOF

chmod +x run_once_install-starship.sh
```

### 4. Optional: Add a chezmoi config file
Create `.chezmoi.toml.tmpl` in your repo root for machine-specific configs:

```toml
[data]
    email = "your.email@example.com"
    name = "Your Name"
```

Then you can use templates in your `dot_gitconfig`:
```ini
[user]
    email = {{ .email | quote }}
    name = {{ .name | quote }}
```

### 5. Test the migration
```bash
# Dry run to see what would change
chezmoi diff

# Apply the changes
chezmoi apply -v

# Verify symlinks are replaced with actual files
ls -la ~/.zshrc ~/.gitconfig ~/.config/starship.toml
```

### 6. Update your repository
```bash
# Remove old files
rm install.sh

# Add a README for chezmoi usage
cat > README.md << 'EOF'
# Dotfiles

Managed with [chezmoi](https://www.chezmoi.io/).

## Installation on a new machine

```bash
# Install and apply dotfiles in one command
sh -c "$(curl -fsL get.chezmoi.io)" -- init --apply yourusername

# OR step by step:
# 1. Install chezmoi
sh -c "$(curl -fsL get.chezmoi.io)"

# 2. Initialize and apply
chezmoi init --apply https://github.com/yourusername/dotfiles.git
```

## Daily usage

```bash
# Pull latest changes and apply
chezmoi update

# Edit a file
chezmoi edit ~/.zshrc
chezmoi apply

# Add a new file
chezmoi add ~/.config/newfile

# See what would change
chezmoi diff
```
EOF

# Commit changes
git add -A
git commit -m "Migrate to chezmoi dotfiles management"
```

## Key Differences from install.sh

1. **No symlinks**: chezmoi copies files instead of symlinking (though symlinks are possible with `symlink_` prefix)
2. **Automatic**: `chezmoi apply` handles everything - no manual mkdir needed
3. **Idempotent**: Running `chezmoi apply` multiple times is safe
4. **Templates**: Support for machine-specific configurations
5. **Built-in VCS**: `chezmoi update` pulls and applies changes in one command

## Benefits
- Single binary, works everywhere
- Handles file permissions, templates, encryption
- Machine-specific configurations
- Automatic backup before overwriting
- Dry-run mode to preview changes