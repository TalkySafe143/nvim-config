"General editor settings
set tabstop=4
set nocompatible
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set ruler
set showcmd
set incsearch
set shellslash
set number
set relativenumber
set cino+=L0 
syntax on
filetype indent on
filetype off
setlocal indentkeys-=:
"keybindings for { completion, "Control-S" for escape, ctrl-a to select all and copy that
inoremap {<CR>  {<CR>}<Esc>O
inoremap {}     {}
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ()    ()
imap <C-s>         <Esc>
map <C-a> <esc>ggVG"+y<CR>
set belloff=all
 
"Append template to new C++ files
autocmd BufNewFile *.cpp 0r /home/talkysafe143/Desktop/Carpeta Sebastian/Trabajos Virtuales/Universidad/IngSistemas/ACM/Codeforces/template.cpp
 
"Compile and run
"Note that the next uncommented line requires the build.sh script!
"Replace it with the commented line below if you don't have it
"set makeprg=g++\ -static\ -DDEBUG\ -lm\ -s\ -x\ c++\ -Wall\ -Wextra\ -O2\ -std=c++17\ -o\ %:r\ %
set makeprg=build.sh\ %:r
autocmd filetype cpp nnoremap <F8> :w <bar> !build.sh %:r <CR>
autocmd filetype cpp nnoremap <F9> :vertical terminal ++shell ++cols=40 ./%:r<CR>
autocmd filetype cpp nnoremap <F7> :!./%:r<CR>
autocmd filetype java nnoremap <F8> :w <bar> !javac %<CR>
autocmd filetype java nnoremap <F9> :vertical terminal ++shell ++cols=40 java %:r<CR>
autocmd filetype java nnoremap <F7> :!java %:r<CR>
 
"LaTeX settings
autocmd FileType tex :NoMatchParen
autocmd FileType tex :set tw=110
