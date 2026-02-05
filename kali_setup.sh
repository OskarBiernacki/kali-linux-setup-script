#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'
BOLD='\033[1m'

print_banner() {
    echo -e "${PURPLE}"
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║                                                          ║"
    echo -e "║                 ${BOLD}${RED}KALI SETUP SCRIPT${NC}${PURPLE}                        ║"
    echo "║                                                          ║"
    echo -e "║                                     author: ${GREEN}p0mido${PURPLE}       ║"
    echo "║                                                          ║"
    echo -e "╚══════════════════════════════════════════════════════════╝${NC}"
    echo ""
}

print_stage() {
    echo -e "${BLUE}${BOLD}[*]${NC} ${CYAN}$1${NC}"
}

print_success() {
    echo -e "${GREEN}${BOLD}[✓]${NC} ${GREEN}$1${NC}"
}

print_banner

print_stage "Starting auto setup..."
echo ""
####CHECK USER
print_stage 'Checking user'
username=$(whoami)
echo "current user: ${username}"
if [ "$username" != "kali" ]; then
    echo 'username is not kali!!!!'
    exit
fi

####NOPASSWD
print_stage "Adding sudo NOPASSWD to kali..."
sudo bash -c 'echo "kali ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/kali-nopasswd'
sudo chmod 440 /etc/sudoers.d/kali-nopasswd
print_success "kali are sudoer with nopasswd"
####Installing tools
print_stage "Updating and installing tools..."
sudo apt update
sudo apt upgrade
sudo apt install -y open-vm-tools open-vm-tools-desktop
sudo apt install docker-cli docker-compose docker.io seclists -y 
####vim configuration
print_stage "vim configuration..."
sudo apt update && sudo apt install -y vim git curl
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo apt install -y build-essential cmake python3-dev
vim +PluginInstall +qall
cd ~/.vim/bundle/YouCompleteMe
sudo python3 install.py --all
echo "set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'airblade/vim-gitgutter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()
filetype plugin indent on
syntax on
colorscheme gruvbox
set background=dark
set number
set cursorline
set mouse=a
set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set autoread
set noswapfile
set nobackup
set nowritebackup
set splitbelow
set splitright
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let mapleader = ','
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a
vnoremap <C-c> \"+y
nnoremap <C-v> \"+p
inoremap <C-v> <Esc>\"+pa" > ~/.vimrc
#### vs code install
print_stage 'Installing vscode'
wget 'https://go.microsoft.com/fwlink/?LinkID=760868'
vscode_file=`ls ./*.deb`[0]
echo $vscode_file
sudo apt install "./${vscode_file}"
#### installing python3.12.0
c_pwd=$(pwd)
cd /tmp
wget 'https://www.python.org/ftp/python/3.12.0/Python-3.12.0.tgz'
tar xzf Python-3.12.0.tgz
./configure --enable-optimizations
sudo make altinstall
cd $c_pwd
####BurpSuitePro install
cd ~/
mkdir Tools
cd Tools
sudo apt update && sudo apt install -y wget && wget -qO- https://raw.githubusercontent.com/xiv3r/Burpsuite-Professional/main/install.sh | sudo bash

echo ''
echo "reboot to applay changes..."
echo -e "${GREEN}${BOLD}[+]${NC} ${GREEN}config done!${NC}"


