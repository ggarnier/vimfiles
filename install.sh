#!/bin/bash

echo "====> Installing Neovim"

case "$(uname -s)" in

  Darwin)
    echo 'Mac OS X'
    brew install neovim/neovim/neovim python3
    ;;

  Linux)
    echo 'Linux'
    sudo apt-get install -y software-properties-common
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo apt-get update -y
    sudo apt-get install -y neovim
    ;;
  *)
    echo 'OS not detected'
    ;;
esac

echo "====> Downloading vimfiles"
mkdir -p ~/.config
git clone https://github.com/ggarnier/vimfiles.git ~/.config/nvim

echo "====> Installing plugins"
nvim +PlugInstall +qa! && echo "Done! :)"
