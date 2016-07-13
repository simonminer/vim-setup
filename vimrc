" increase the amount of time vim swaps and syncs buffers so
" that less is lost in the event of a crash.
" set updatecount=10
" set swapsync='sync'
" do not create backup files
" set nobackup
" wrap to top of file when searching
set wrapscan
" turn on auto-indenting
set smartindent
" expand tabs
set expandtab
" number of spaces for indenting
set shiftwidth=2
" show line numbers
set number
" allow deleting prior to the start of the current insert/edit
set backspace=indent,eol,start
" show current position (ruler) in bottom right corner
set ruler
" tab width 
set tabstop=4
" turn on syntax colors
syntax on

" browser-like paging
nmap <space> <pagedown>

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

" Perl
iabbr p#! #!/usr/local/bin/perl<cr><cr>use strict;<cr>use warnings;<cr>
iabbr pif if ( ) {<cr>__CODE<up><left><left><left><left>
iabbr pelsif elsif ( ) {<cr>__CODE<up><left><left><left>
iabbr pelse else {<cr>
iabbr pife if ( ) {<cr>__CODE<esc><down>$a<cr>else {<cr>__CODE<up><up><up><up><left><left><left><left>
imap p?: x ? __COND1 : __COND2<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><esc>xi
iabbr punless unless ( ) {<cr>__CODE<up><left>
iabbr pwhile while ( ) {<cr>__CODE<up><left><left><left>
iabbr pfor foreach my ( __CONDITION ) {<cr>__CODE<up>
iabbr pfork foreach my ( keys( __HASH ) ) {<cr>__CODE<up>
iabbr pforsk foreach my ( sort( { __CONDITION } keys( __HASH ) ) ) {<cr>__CODE<up>
iabbr psub sub {<cr>my( __PARAMS ) = @_;<cr>__CODE<up><up><left><left>
iabbr popen open( my $fh, '<', ) or die "Could not open file __FILE: $!";<cr>while ( <$fh> ) {<cr>chomp;<cr>__CODE<down><cr>close( $fh );<up><up><up><up><up><right><right><right><right><right>
iabbr popendir opendir( DIR, ) or die "Could not open directory __DIRECTORY: $!";<cr>my @files = map( { /^\.\.?$/ ? () : $_ } readdir( DIR ) );<cr><cr>closedir( DIR );<cr><up><up><up><up><right><right><right><right><right><right><right><right><right><right><right><right><right>
imap p/ m//xsm<left><left><left><left>
imap ps/ s//__NEW/xsm<left><left><left><left><left><left><left><left><left><left>
imap pqw qw(  )<left><left>
imap pjoin join( , __LIST )<left><left><left><left><left><left><left><left><left><left>
imap psplit split( //, __STRING )<left><left><left><left><left><left><left><left><left><left><left><left><left>
imap pmap map( {  } __LIST )<left><left><left><left><left><left><left><left><left><left><left>
imap pgrep grep( , __LIST )<left><left><left><left><left><left><left><left><left><left>
imap ppush push( , __LIST )<left><left><left><left><left><left><left><left><left><left>
imap pcroak croak  unless __CONDITION;<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>""
imap pdef defined(  )<left><left>
imap pexi exists(  )<left><left>

" Common Perl shortcuts @ Christianbook.com
iabbr pdate my( $day, $month, $year ) = ( localtime() )[3..5];<cr>my $datestamp = sprintf( "%04d%02d%02d", $year + 1900, $month + 1, $day );<cr>
iabbr ptime my( $sec, $min, $hour, $day, $month, $year ) = ( localtime() )[0..5];<cr>my $timestamp = sprintf( "%04d%02d%02d%02d%02s%02s", $year + 1900, $month + 1, $day, $hour, $min, $sec );<cr>
imap ppackage package <cr><cr>1;<cr><cr>__DATA__<cr><up><up><up><up><up><right><right><right><right><right><right><right><right>
iabbr pnew sub new {<cr>my $class = shift;<cr>my $self = {};<cr>bless( $self, $class );<cr>return $self;<down><down>
iabbr pauto use Carp qw( croak );<cr>use vars qw( $AUTOLOAD );<cr><cr>my @attrs = qw( );<cr>my %attributes = ();<cr>@attributes{@attrs} = map( { 1 } @attrs );<cr><cr>sub AUTOLOAD {<cr>my $self = shift;<cr>my $attr = $AUTOLOAD;<cr>$attr =~ s/.*:://;<cr>croak "Invalid attribute method: ->$attr()" unless exists( $attributes{$attr} );<cr><cr>my $prev = $self->{$attr};<cr>$self->{$attr} = shift if @_;<cr>return $prev;<up><up><up><up><up><up><up><up><up><up><up><up><left><left>
iabbr pusetyp use lib '/www/modules';<cr>use DBI::DatabaseSession;<cr>use Log::Writer;<cr>
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

set ignorecase
set smartcase
set incsearch

execute pathogen#infect()
