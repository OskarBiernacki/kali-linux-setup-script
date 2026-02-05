# Kali Linux Auto-Setup Script

## Overview
An automated setup script for configuring a Kali Linux environment with essential penetration testing and development tools.

## Features
- Configure passwordless sudo for the `kali` user
- Install essential tools (Docker, SecLists, VMware tools)
- Advanced Vim configuration with plugins
- Install Visual Studio Code
- Install Python 3.12.0
- Install Burp Suite Professional

## Quick Start

```bash
# Make the script executable
chmod +x kali_setup.sh

# Run the script
./kali_setup.sh
```

## Script Structure

### 1. **Initial Configuration**
- User verification (requires `kali` user)
- Passwordless sudo configuration

### 2. **System Tools Installation**
```bash
# System updates
sudo apt update && sudo apt upgrade -y

# Essential packages:
- open-vm-tools (for VMware integration)
- Docker and Docker Compose
- SecLists (wordlists for testing)
```

### 3. **Vim Configuration**
- Vundle plugin manager installation
- Plugins included:
  - NERDTree (file explorer)
  - vim-airline (status bar)
  - gruvbox (color scheme)
  - YouCompleteMe (code completion)
  - Additional productivity plugins

### 4. **Visual Studio Code Installation**
- Downloads latest .deb package
- Automatic installation

### 5. **Python 3.12.0 Installation**
- Compiled from source
- Optimized build installation

### 6. **Burp Suite Professional Installation**
- Automatic installation via script
- Installed to `~/Tools/` directory

## Prerequisites

### System Requirements
- Kali Linux (tested on latest version)
- User account: `kali`
- Internet connection
- Minimum 4GB RAM (8GB recommended)
- 20GB free disk space

### Permissions
Script must be run as `kali` user with sudo privileges.

## Color-Coded Interface
The script uses color-coded output for different stages:
- **Blue** - Configuration stages
- **Green** - Successfully completed tasks
- **Yellow** - Warnings
- **Red** - Errors
- **Purple** - Banner and headers

## Directory Structure After Installation

```
~/
├── .vim/
│   ├── bundle/          # Vim plugins
│   └── .vimrc          # Vim configuration
├── Tools/
│   └── burpsuite/      # Burp Suite Professional
└── Python-3.12.0/      # Python source code
```

## Troubleshooting

### 1. **Error: "username is not kali"**
```bash
# Create kali user
sudo useradd -m kali
sudo passwd kali
# Or rename current user
```

### 2. **Vim Plugin Installation Errors**
```bash
# Manual Vundle installation
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

### 3. **Missing Sudo Privileges**
```bash
# Add user to sudo group
sudo usermod -aG sudo kali
```

### 4. **Python Installation Issues**
```bash
# Install dependencies
sudo apt install -y build-essential libssl-dev zlib1g-dev \
libncurses5-dev libncursesw5-dev libreadline-dev libsqlite3-dev \
libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev libffi-dev
```

## Manual Recovery

### Restore Password Requirement for Sudo
```bash
sudo rm /etc/sudoers.d/kali-nopasswd
```

### Remove Vim Configuration
```bash
rm -rf ~/.vim ~/.vimrc
```

## Important Notes
1. **Restart Required** - System restart is necessary after script completion
2. **Burp Suite** - Requires separate license/activation
3. **Python 3.12** - Installed as `python3.12` (parallel to system Python)
4. **VMware Tools** - Only functional in VMware environment

## Warnings
- This script modifies system configuration
- Sets passwordless sudo (security risk on shared systems)
- Installs unofficial Burp Suite script (use at your own risk)

## Updating the Script
```bash
# Download latest version
wget -O kali_setup.sh https://raw.githubusercontent.com/your-repo/kali-setup/main/kali_setup.sh

# Make executable and run
chmod +x kali_setup.sh
./kali_setup.sh
```

## License
MIT License - See LICENSE file for details

## Author
**p0mido** - [GitHub Profile](https://github.com/OskarBiernacki)

## Support
If you encounter issues:
1. Check the "Troubleshooting" section
2. Ensure you have the latest Kali version
3. Verify internet connection

---
*This script has been tested on Kali Linux 2024.1. Compatibility with other distributions is not guaranteed.*
