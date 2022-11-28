FROM ubuntu:22.04

# Instaling git and languages
# Shell and terminal configs
RUN apt update \
    && apt install -y git \
    && apt install -y tmux \
    && apt install -y python3.10 \
    && apt install -y golang gopls \
    && apt-get install curl -y \
    && curl -sS https://starship.rs/install.sh | sh -s -- -y

# Install Neovim and dependencies
RUN apt-get update \
    && cd ~ && mkdir -p .config/nvim \
    && curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb\
    && apt install ./nvim-linux64.deb \
    && apt-get install python3-neovim -y

# Setup Neovim
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim \
    && git clone https://github.com/mr-destructive/dotfiles \
    && mv dotfiles/nvim/** ~/.config/nvim \
    && mv dotfiles/** ~/

# Setup starship
RUN echo eval "$(starship init bash)" >> ~/.bashrc


 CMD "bash"
