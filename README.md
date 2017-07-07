# vim-setup

My personal setup for the vim editor, including .vimrc file and plugins.

## Prerequisites

* This project was developed on and for Mac OSX El Capitan and CentOS 5 and 6
Your mileage may vary on other platforms.
* The setup assumes vim 7.4 or later.

## Installation

Clone this GitHub repository.

    git clone https:////github.com/simonminer/vim-setup.git
    
Run the setup script.

    cd vim-setup
    ./setup.sh

You should be good to go.

(Note: When pulling and update, you should run ``git submodule init`` and ``git submodule update``
to ensure you have the necessary and most up-to-date versions of the vim plugins used in this setup.)

## Description

vim-setup configures the customize vim environment that I use. This sincludes the following resources:

* vimrc file (symlinked to ~/.vim by installation script) - Customization highlights include:

  * Leader key set to space instead of backslash.
  * The [desert](https://github.com/fugalh/desert.vim) color scheme.
  * Incremental highlighted search.
  * Shortcuts for oft-used, but cumbersome-to-type commands, such as these.
    * &lt;space> h - clear highlighting of last search
    * &lt;space> n - toggle line numbers
    * &lt;space> p - insert in paste mode (keeps the formatting of the copied text)
    * &lt;space> s - Reload .vimrc file (good for seeing changes without exiting the file)
    * &lt;space> x - Toggle syntax checking on write with Syntastic
    * &lt;space> 1/2/3/4 - common Perl commands: syntax check, debugger, perltidy, and prove respectively on current file


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
  * [syntastic.vim](https://github.com/scrooloose/syntastic) - Automatic syntax checking for the following languages:
    * Perl - via ``perl -c``.
    * HTML - using [Tidy](http://www.html-tidy.org/) which must be installed on the system.
    * Javascript - using [JSHint](http://jshint.com) which must be installed on the system.

The installation script (setup.sh) takes care of mapping these resources to your vim environment by
creating symbolic links to your ~/.vim directory and ~/.vimrc file. Before doing this, it first backs up
your existing .vim and .vimrc (if they exist) to .vim.bak and .vimrc.bak, respectively.

vim-setup uses [pathogen.vim](https://github.com/tpope/vim-pathogen) for plugin management.

## Author

* **Simon Miner** - *Primary (only?) author and user* - [SimonMiner](https://github.com/simonminer)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thanks to Marc G. Gauthier (@marcgg) for his [inspirational blog post on setting up vim from scratch](http://marcgg.com/blog/2016/03/01/vimrc-example/).

