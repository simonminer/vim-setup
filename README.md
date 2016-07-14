# vim-setup

My personal setup for the vim editor, including .vimrc file and plugins.

## Prerequisites

* This project was developed on and for Mac OSX El Capitan and CentOS 5 and 6
Your mileage may vary on other platforms.
* The setup assumes Git 7.4 or later.

## Installation

Clone this GitHub repository.

    git clone https:////github.com/simonminer/vim-setup.git
    
Run the setup script.

    cd vim-setup
    ./setup.sh

You should be good to go.

## Description

vim-setup configures the customize vim environment that I use. This sincludes the following resources:

* vimrc file (symlinked to ~/.vim by installation script).
* Several vim plugins installed as git submodules. These can be updated by running `git submodule update` and
include the following:

  * [NERDCommenter](https://github.com/scrooloose/nerdcommenter.git) - Easy commenting/uncommengint of code blocks
  * [rails.vim](http://github.com/tpope/vim-rails.git) - Power tools for writing Ruby on Rails apps.
  * [repeat.vim](https://github.com/tpope/vim-repeat) - Extension to make . work with surround.vim and other vim plugins
  * [sensible.vim](https://github.com/tpope/vim-sensible) - Overrides of native vim commands that make sense.
  * [SnipMate](https://github.com/garbas/vim-snipmate.git) - Port of TextMate's snippets functionality. (The [tlib](http:////github.com/tomtom/tlib_vim.git) and [vim-addon-mw-utils](https://github.com/MarcWeber/vim-addon-mw-utils) dependencies are also installed.) Customized snippet files are located in the `snippets/` directory and currently include the following:
    * css.snippets
    * html.snippets
    * java.snippets
    * javascript-jquery.snippets
    * javascript.snippets
    * markdown.snippets
    * mustache.snippets
    * perl.snippets
    * puppet.snippets
    * rails.snippets
    * ruby.snippets
    * scss.snippets
    * sql.snippets
    * xml.snippets
  * [surround.vim](https://github.com/tpope/vim-surround) - Commands to make quoting/parenthesizing/tagging simpler.

The installation script (setup.sh) takes care of mapping these resources to your vim environment by
creating symbolic links to your ~/.vim directory and ~/.vimrc file. Before doing this, it first backs up
your existing .vim and .vimrc (if they exist) to .vim.bak and .vimrc.bak, respectively.

## Author

* **Simon Miner** - *Primary (only?) author and user* - [SimonMiner](https://github.com/simonminer)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thanks to Marc G. Gauthier (@marcgg) for his [inspirational blog post on setting up vim from scratch](http://marcgg.com/blog/2016/03/01/vimrc-example/).

