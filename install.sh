# Squash "No such file" errors
rm ~/.vimrc &> /dev/null
rm ~/.gvimrc &> /dev/null
rm ~/.nvimrc &> /dev/null
rm ~/.nvim &> /dev/null

ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
ln -s ~/.vim/vimrc ~/.nvimrc
ln -s ~/.vim ~/.nvim

lua download.lua
