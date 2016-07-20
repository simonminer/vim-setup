" use pathogen to manage Vim plugins
execute pathogen#infect()
call pathogen#infect('bundle/{}')

" use space to start commands
let mapleader=" "

" reload .vimrc without exiting vim
map <leader>s :source ~/.vimrc<CR>

" do not create backup files
set nobackup

" show and toggle line numbers
set number
nmap <leader>n :set number!<cr>

" Ttab = 4 spaces
set tabstop=4
set expandtab

" figure out when to autoindent (2 spaces)
set smartindent
set shiftwidth=4

" allow deleting prior to the start of the current insert/edit
set backspace=indent,eol,start

" show current position (ruler) in bottom right corner
set ruler

" jump to last cursor position when opening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" highlight searches as they happen
set ignorecase
set smartcase
set incsearch
set hlsearch

" wrap to top of file when searching
set wrapscan

" keep more in memory to speed things up
set hidden
set history=100

" set color scheme and syntax highlighting based on file type
filetype on
syntax enable
set background=dark
colorscheme desert

" classify files with no extension as Perl
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=perl | endif
"
" turn off # exiting left
inoremap # X<C-H>#

nmap <F4> :!rake test %<cr>

" Paste Mode On/Off
cmap <F7> :call Paste_on_off()<cr>
set pastetoggle=<F7>

let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
        if g:paste_mode == 0
                set paste
                let g:paste_mode = 1
        else
                set nopaste
                let g:paste_mode = 0
        endif
        return
endfunc


" Delimiters
imap (( (  )<left><left>
imap [[ []<left>
imap {{ {}<left>
imap {<cr> {<cr>}<up><esc>$a<cr>
imap '' ''<left>
imap "" ""<left>
imap `` ``<left>

" Run Perl commands on the curent file
map <esc><leader>1 :!perl -c %<cr>
map <esc><leader>2 :!perl -d %<cr>
map <esc><leader>3 :%!perltidy<cr>
map <esc><leader>4 :!prove -v %<cr>

" Common Perl shortcuts @ Christianbook.com
iabbr pdb my $db = DBI::DatabaseSession->new();<cr>
iabbr pdbr my $sth = $db->run( );<left><left><left>
iabbr pdbf while ( my( ) = $sth->fetchrow() ) {<cr>__CODE<down><down>$sth->finish();<up><up><up><up><left><left><left><left>
iabbr plog my $logfile =;<cr>my $log = Log::Writer->new( file => $logfile );<cr><up><up><right><right><right><right><right><right><right><right><right><right><right><right><right>
iabbr plogi $log->init();<cr><cr><cr>$log->cleanup();<up><up>
imap pln $log->info( " " )<left><left><left><esc>xi
imap plb $log->abort( " " ) unless __CONDITION;<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><esc>xi
iabbr psql my $sql = <<"END_SQL";<cr><cr><left><left><left><left>END_SQL<cr><up><up><left><left>
iabbr pfin $sth->finish();<cr>
imap pgetopt use Getopt::Std;<cr>my %args;<cr>getopts( ' ', \%args );<cr><up><right><right><right><right><right><right><right><right><right><right><right><esc>xi
imap pqp $q->param( ' ' )<left><left><left><esc>xi
iabbr podh1 =head1 NAME<cr><cr><cr>=head1 SYNOPSIS<cr><cr>    __SYNOPSIS<cr><left><left><left><left><cr>=head1 DESCRIPTION<cr><cr>__DESCRIPTION<cr><cr>=cut<cr><up><up><up><up><up><up><up><up><up><up><up>
iabbr podi =item <cr><cr>=cut<cr><up><up><up><right><right><right><right><right>
iabbr pclass #!/usr/local/bin/perl<cr><cr>=head1 NAME<cr><cr><cr><cr>=head1 SYNOPSIS<cr><cr>    __SYNOPSIS<cr><left><left><left><left><cr>=head1 DESCRIPTION<cr><cr>__DESCRIPTION<cr><cr>=cut<cr><cr>package __PACKAGE;<cr><cr>use strict;<cr>use warnings;<cr><cr>use Carp qw( croak );<cr>use vars qw( $AUTOLOAD );<cr><cr>my @attrs = qw( __ATTRS );<cr>my %attributes = ();<cr>@attributes{@attrs} = map( { 1 } @attrs );<cr><cr>sub new {<cr>my $class = shift;<cr>my $self = {};<cr>bless( $self, $class );<cr>return $self;<down><cr><cr>sub AUTOLOAD {<cr>my $self = shift;<cr>my $attr = $AUTOLOAD;<cr>$attr =~ s/.*:://;<cr>croak "Invalid attribute method: ->$attr()" unless exists( $attributes{$attr} );<cr><cr>my $prev = $self->{$attr};<cr>$self->{$attr} = shift if @_;<cr>return $prev;<down><down><cr><cr>1;<up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up><up>
imap pnotice Apache->request->log->notice( " " );<left><left><left><left><esc>s
imap pdump use Data::Dumper;<cr>Dumper( );<esc><left><left><left>a

" Coats
imap pce if ( $Coats::ACTIVE ) {<cr>my $type = ' ';<cr>my %details = ( __DETAILS );<cr>Coats::Event->log( $type, %details );<up><up><left><left><esc>xi
imap pcd $Coats::DEBUGGER->debug(  )<cr>  if $Coats::DEBUGGER;<up><right><right><right>

" SQL
iabbr qse select<cr>from __FROM<cr>where __WHERE<up><up>
iabbr qin insert into ( __COLUMNS )<cr>values ( __VALUES )<up><left><left><left><left><left><left><left><left><left><left><left>
iabbr qup update<cr>set __SET<cr>where __WHERE<up><up>
iabbr qde delete from<cr>where __WHERE<up>

" Oracle DDL statements
iabbr otab create table (<cr>  __COLUMN_NAME<cr>)<cr>storage ( initial 1M next 1M minextents 1 maxextents unlimited pctincrease 0 )<cr>tablespace __TABLESPACE_NAME;<up><up><up><up><left><left>
iabbr opk alter table add constraint __CONSTRAINT_NAME primary key ( id ) using index<cr>  storage ( initial 1M next 1M minextents 1 maxextents unlimited pctincrease 0 )<cr>tablespace __TABLESPACE_NAME;<up><up><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
iabbr oidx create index on __TABLE_NAME ( __COLUMN_NAME )<cr>  storage ( initial 1M next 1M minextents 1 maxextents unlimited pctincrease 0 )<cr>tablespace __TABLESPACE_NAME;<up><up><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
iabbr oseq create sequence start with 1000000;<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>

" Ruby and Rails
imap rdef def<cr>end<up><space>
imap rtest test ''<esc><right>a do<cr>__CODE<cr>end<up><up><right><right><right>
imap rputs puts ""
imap r# #{{

" Go to the next double underscore and replace the word that follows it.
nmap _ /__<cr>cw
" Add a semi-colon at the end of this line and go to the next.
nmap ; $a;<cr>

" Template Toolkit
imap [% [%  %]<esc><left><left><left>a
