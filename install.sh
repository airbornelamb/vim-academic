sudo apt update
sudo apt remove vim*
sudo apt install -y vim-nox-py2 git pandoc pandoc-citeproc ranger

sudo dnf -y update
sudo dnf -y install vim-enhanced git pandoc pandoc-citeproc ranger

echo "runtime vimrc" > ~/.vimrc
mkdir ~/.vim
git clone https://github.com/airbornelamb/vim-academic.git ~/vim-academic
cp ~/vim-academic/vimrc ~/.vim/vimrc
vim
cat ./bashrcappend >> ~/.bashrc
