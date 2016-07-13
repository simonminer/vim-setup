# vim-setup

My personal setup for the Vim editor, including .vimrc file and plugins.

### Prerequisites

* This project was developed on and for Mac OSX El Capitan and CentOS 5 and 6. Your mileage may vary on other platforms.
* The setup assumes Git 7.4 or later.

### Installing

Clone this GitHub repository.

    git clone https:////github.com/simonminer/vim-setup.git
    
Create symbolic links for the .vimrc file and .vim folder in your home directory.

    cd vim-setup
    mv ~/.vimrc ~/.vimrc.bak
    mv ~/.vim ~/.vim.bak
    ln -s $PWD/vimrc ~/.vimrc
    ln -s $PWD ~/.vim

## Author

* **Simon Miner** - *Primary (only?) author and user* - [SimonMiner](https://github.com/simonminer)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thanks to Marc G. Gauthier (@marcgg) for his [execellent blog post on setting up Vim from scratch](http://marcgg.com/blog/2016/03/01/vimrc-example/).
