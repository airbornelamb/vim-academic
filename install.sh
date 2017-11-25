sudo apt update
sudo apt remove vim*
sudo apt install -y vim-nox-py2 git pandoc pandoc-citeproc

sudo dnf install vim-enhanced git pandoc pandoc-citeproc

echo "runtime vimrc" > ~/.vimrc
mkdir ~/.vim
git clone https://github.com/airbornelamb/vim-academic.git ~/vim-academic
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/vim-academic/vimrc ~/.vim/vimrc
vim +PluginInstall
