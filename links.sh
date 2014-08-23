rm ~/.vimrc
rm ~/.gvimrc
ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

rm ../.neovimrc
ln -s ~/.vim/vimrc ~/.neovimrc
ln -s ~/.vim ~/.neovim

lua download.lua
