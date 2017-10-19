sudo apt remove vim*
sudo apt install vim-nox-py2 git wget
echo "runtime vimrc" > ~/.vimrc
mkdir ~/.vim
cd ~/.vim
wget https://raw.githubusercontent.com/airbornelamb/vim-starter/master/vimrc
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall
