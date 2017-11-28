# my-nvim-config
My personal vim configuration file

# Basic setup
* Install [Ubuntu 17.10 (Artful Aardvark)](http://releases.ubuntu.com/17.10/)
* Install pip3 `sudo apt install python3-pip`
* Install git `sudo apt install git`

# Vim
* Install neovim `sudo apt install neovim`
* Update neovim python3 `pip3 install neovim`
* Clone vim config
```
git clone https://github.com/hugolamarrephd/my-nvim-config/ ~/.config/nvim/
```
* Install plug
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c :PlugInstall
