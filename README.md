# vim-academic
Starter Vim setup for academic writing in markdown with pandoc and bibtex support

## What does this do?

During my academic time I procrastinated writing papers because the internet was a click away. I knew that Vim was a good answer because I could restrict myself to only using the terminal. However Vim is complicated to setup.

This will give you a minimal vim installation with python 2 support, vundle, pandoc support, goyo and limelight, and several themes. It is designed to get you quickly up and running on a new system for academic writing without much fuss.

## Installation

Backup your `~/.vimrc` file and `~/.vim/` folder (this is not important if you haven't used Vim before). The installation will remove vim from the system first because some vim versions do not have python support. You will want to install the vim-nox or vim packages for your distribution.

You could also check if you have support already and remove python from the install script:

```bash
vim --version | grep '+python'
```

### Ubuntu / Fedora

```bash
git clone https://github.com/airbornelamb/vim-academic.git ~/vim-academic
```
Then
```bash
~/vim-academic/install.sh
```

The first time that Vim opens it will launch `vim +PluginInstall` to install all vundle plugins. You may then simply run `vim` in the terminal after that.

You're all set! Enjoy!

## Usage

+ This assumes that you have installed Zotero 4, which you can [download for linux here](https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64&version=4.0.29.10)
+ and Better Bibtex plugin, which you can [download here](https://github.com/retorquere/zotero-better-bibtex/releases/download/1.6.100/zotero-better-bibtex-1.6.100.xpi) and use these [install instructions](https://github.com/retorquere/zotero-better-bibtex/wiki/Installation)

An example workflow will then be as follows:

1. Import sources into Zotero (manually or with the browser clipper)
2. Export sources into better bibtex .bib file into `~/vim-academic`
3. Begin editing with vim. IT IS IMPORTANT THAT YOUR PAPER USES .mkd extension and is NAMED THE SAME AS the bibtex .bib file (ex. mypaper.mkd and mypaper.bib)
  * `<Tab>`: While entering a citation (ex. @kostenberger) you may press tab to search and insert citation keys
  * `:Goyo`: Entering this in normal mode will launch Goyo and Limelight together for distraction-free writing
  * `<F5>`: Will toggle Goyo (same as entering `:Goyo`
  * `<F6>`: Will toggle the UndoTree
  * `<F7>`: Traverses backwards in the UndoTree
  * `<F8>`: Traverses forwards in the UndoTree
  * `g <Ctrl-g>`: pressing this sequence in command mode will give you document statistics, including word count.
  * `:F` : Will start full-text search with fzf and ripgrep. Very powerful!
  
FZF Key bindings for command line ( from junegunn/fzf )
-----------------------------

The install script will setup the following key bindings for bash, zsh, and
fish.

- `CTRL-T` - Paste the selected files and directories onto the command line
    - Set `FZF_CTRL_T_COMMAND` to override the default command
    - Set `FZF_CTRL_T_OPTS` to pass additional options
- `CTRL-R` - Paste the selected command from history onto the command line
    - If you want to see the commands in chronological order, press `CTRL-R`
      again which toggles sorting by relevance
    - Set `FZF_CTRL_R_OPTS` to pass additional options
- `ALT-C` - cd into the selected directory
    - Set `FZF_ALT_C_COMMAND` to override the default command
    - Set `FZF_ALT_C_OPTS` to pass additional options

If you're on a tmux session, you can start fzf in a split pane by setting
`FZF_TMUX` to 1, and change the height of the pane with `FZF_TMUX_HEIGHT`
(e.g. `20`, `50%`).
  
# Conversion

When you are done writing, use pandoc from the terminal to convert to your final result, such as DOCX
```bash
pandoc PAPER.mkd --smart --standalone --bibliography PAPER.bib --csl=Turabian-NO-Ibid.csl --reference-docx=prtstemplate.docx -o FINALPAPER.docx
```

Or for HTML output
```bash
pandoc PAPER.mkd --smart --standalone --bibliography PAPER.bib --csl=Turabian-NO-Ibid.csl --reference-docx=prtstemplate.docx -css splendor.css -o FINALPAPER.html
```


## Extra

+ Use any of the CSS themes from the excellent [Markdown CSS](http://markdowncss.github.io/)
+ Other functions should work as expected. You can define key mappings for your own usage by editing the file `~/.vim/vimrc`, and you are certainly encouraged to do so. That's how you can get the most out of Vim.
+ If you're looking for a quick tutorial to learn Vim, "[Learn Vim Progressively](http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/)" is a great one.
