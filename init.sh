#!/bin/bash

current_dir=$(pwd)

function config_tmux(){

    echo "tmux config"
    tmux_source="source-file ${current_dir}/tmux.conf"
    echo "$tmux_source" >> ~/.tmux.conf
    tmux source-file ~/.tmux.conf
}

function config_vim(){

    echo "vim config"
    vim_source="source ${current_dir}/vimrc"
    #echo "$vim_source" >> ~/.vimrc
    #echo "source ${current_dir}/coc.vim" >> ~/.vimrc

    if [ ! -d "$HOME/.config/nvim" ]; then
         mkdir -p ~/.config/nvim
    fi
    echo "$vim_source" >> ~/.config/nvim/init.vim
    echo "source ${current_dir}/coc.vim" >> ~/.config/nvim/init.vim
    #echo "source ${current_dir}/markdown-preview.vim" >> ~/.config/nvim/init.vim
    ln -s "${current_dir}"/coc-settings.json ~/.config/nvim/coc-settings.json
}

function config_ssh(){
    echo "ssh config"
    ln -s "$current_dir"/ssh/config ~/.ssh/config
}

function config_supervisor(){
    echo "ssh supervisor"
    ln -s "${current_dir}"/supervisor /etc/supervisor
    ln -s "(which supervisorctl)" /usr/local/bin/spc
}

function config_zsh(){
    echo "zshrc config"
    zsh_source="source ${current_dir}/zshrc"
    echo "$zsh_source" >> ~/.zshrc
    #source ~/.zshrc
}

config_tmux
config_vim
config_ssh
#config_supervisor
config_zsh
