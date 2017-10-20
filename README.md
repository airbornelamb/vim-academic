vim-starter
===========

Quick and lightweight starter kit for academic writing with vim.

## Installation

After you backup your `~/.vimrc` file and `~/.vim/` folder (this is not important if you haven't used Vim before). The installation will remove vim from the system first because most vim versions ship with python 3 support and we need python 2 support.

You could also check if you have python 2 support already:

```bash
vim --version | grep '+python'
```

### Ubuntu/Debian

```bash
wget https://raw.githubusercontent.com/airbornelamb/vim-starter/master/install.sh && chmod +x ./install.sh && ./install.sh
```

The first time that Vim opens it will launch "vim +PluginInstall" to install all vundle plugins. You may then simply run "vim" in the terminal after that.

You're all set! Enjoy!

## Usage

+ This assumes that you have installed Zotero 4 [here] (https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64&version=4.0.29.10)
+ and Better Bibtex plugin [here](https://github.com/retorquere/zotero-better-bibtex/releases/download/1.6.100/zotero-better-bibtex-1.6.100.xpi)

Your workflow will then be as follows:

1. Import sources into Zotero (manually or with the browser clipper).
2. Export sources into better bibtex .bib file into your working folder.
3. Begin editing with vim. IT IS IMPORTANT THAT YOUR PAPER USES .mkd extension and is NAMED THE SAME AS .bib (ex. mypaper.mkd and mypaper.bib)
  * `<Tab>`: While entering a citation (@bavinck) you may press tab to search and help complete citation keys from your .bib
  * `:Goyo`: Entering this in normal mode will launch a focus mode for writing sessions
4. pandoc --citeproc


## Extra

Other functions should work as expected. You can define key mappings for your own usage by editing the file `~/.vim/vimrc`, and you are certainly encouraged to do so. That's how you can get the most out of Vim.

If you're looking for a quick tutorial to learn Vim, "[Learn Vim Progressively](http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/)" is a great one.
