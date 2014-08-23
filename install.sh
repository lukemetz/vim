# Squash "No such file" errors
rm ~/.vimrc &> /dev/null
rm ~/.gvimrc &> /dev/null
rm ~/.neovimrc &> /dev/null
rm ~/.neovim &> /dev/null

ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
ln -s ~/.vim/vimrc ~/.neovimrc

ln -s ~/.vim ~/.neovim

lua download.lua
