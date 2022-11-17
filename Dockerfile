FROM ubuntu:22.04
RUN apt update \
    && apt install -y python3.10 \
    && apt install -y git

RUN cd ~ && mkdir -p .config/nvim \
    && apt-get update \
    && apt-get install curl -y \
    && curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb\
    && apt install ./nvim-linux64.deb \
    && apt-get install python3-neovim -y \
    && git clone https://github.com/mr-destructive/dotfiles \
    && mv dotfiles/nvim/** ~/.config/nvim \
    && mv dotfiles/** ~/ \
    && git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim 

 CMD "bash"
