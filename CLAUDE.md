# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository managed by [chezmoi](https://www.chezmoi.io/), a dotfile management tool that handles copying, templating, and applying configuration files across machines.

## Key Commands

### Chezmoi Operations
```bash
# Apply dotfiles to the system
chezmoi apply

# See what changes would be made (dry run)
chezmoi diff

# Edit a managed file (opens in configured editor)
chezmoi edit ~/.zshrc  # or any managed file

# Add a new file to be managed
chezmoi add ~/.config/newfile

# Update from the source repository and apply
chezmoi update

# Execute the install script (installs chezmoi if needed and applies configs)
./install.sh
```

### Repository Structure

- **Naming Convention**: Files use chezmoi's special naming:
  - `dot_` prefix becomes `.` (e.g., `dot_zshrc` → `~/.zshrc`)
  - `dot_config/` becomes `~/.config/`
  - `run_once_*.sh` scripts execute only once per machine

- **Key Files**:
  - `.chezmoi.toml.tmpl`: Template for chezmoi configuration with user data
  - `run_once_install-starship.sh`: Installs starship prompt if not present
  - `install.sh`: Bootstrap script that installs chezmoi and applies dotfiles

## Managed Configurations

The repository manages:
- **Shell**: zsh configuration with aliases and PATH setup
- **Git**: Global git configuration
- **Starship**: Terminal prompt configuration
- **Ghostty**: Terminal emulator configuration with themes

## Development Workflow

When modifying dotfiles:
1. Make changes to files in the chezmoi source directory (this repo)
2. Test with `chezmoi diff` to preview changes
3. Apply with `chezmoi apply -v` for verbose output
4. Commit changes to git

When adding new configurations:
1. Add the file from your home directory: `chezmoi add ~/path/to/file`
2. The file will be copied to this repository with appropriate naming
3. Commit the new file

## Architecture Notes

This is a personal dotfiles repository using chezmoi's file management approach:
- Files are **copied** (not symlinked) to their destinations
- The `run_once_` scripts ensure idempotent installation of dependencies
- Template support via `.tmpl` files allows machine-specific configurations
- The repository structure follows chezmoi conventions for automatic file placement