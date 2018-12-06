# my-nvim-config
My personal neovim configuration file for windows

# Installation

* Install neovim

* Install MikTex, Anaconda, GitHub

* Create nvim27 (Python 2.7) and nvim37 (Python 3.7) environements 
    1. `pip install neovim`
    2. `pip install flake8`
    3. `pip install autopep8`

* Add `~\AppData\Local\GitHubDesktop\app-1.5.0\resources\app\git\cmd`
to global paths (see environment variables in advanced system settings)


* Clone this vim config file (`init.vim`)
```
git clone https://github.com/hugolamarrephd/my-nvim-config/ ~/AppData\Local\nvim\
```

* Install plug
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c :PlugInstall

* Run `:PlugInstall`

* Restart and enjoy!
