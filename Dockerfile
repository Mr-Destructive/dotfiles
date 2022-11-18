FROM ubuntu:22.04

# Install git and terminal stuff
# Programming language pacakges
RUN apt update \
    && apt install -y git tmux curl -y \
    && apt install -y python3.10

# Installing and Setting up Neovim
RUN apt-get update \
    && cd ~ && mkdir -p .config/nvim \
    && curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb\
    && apt install ./nvim-linux64.deb \
    && apt-get install python3-neovim -y \
    && git clone https://github.com/mr-destructive/dotfiles \
    && mv dotfiles/nvim/** ~/.config/nvim \
    && mv dotfiles/** ~/ \
    && git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

 CMD "bash"
