-- VIM style commands
vim.cmd("inoremap jk <Esc>")
vim.cmd("set tabstop=4")
vim.cmd("set nocompatible")
vim.cmd("set shiftwidth=4")
vim.cmd("set expandtab")
vim.cmd("set autoindent")
vim.cmd("set smartindent")
vim.cmd("set ruler")
vim.cmd("set showcmd")
vim.cmd("set incsearch")
vim.cmd("set shellslash")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set cino+=L0")
vim.cmd("tnoremap <Esc> <C-\\><C-n>")
vim.cmd('map <C-a> <esc>ggVG"+y<CR>')
vim.cmd("tnoremap <A-h> <C-\\><C-N><C-w>h")
vim.cmd("tnoremap <A-j> <C-\\><C-N><C-w>j")
vim.cmd("tnoremap <A-k> <C-\\><C-N><C-w>k")
vim.cmd("tnoremap <A-l> <C-\\><C-N><C-w>l")
vim.cmd("inoremap <A-h> <C-\\><C-N><C-w>h")
vim.cmd("inoremap <A-j> <C-\\><C-N><C-w>j")
vim.cmd("inoremap <A-k> <C-\\><C-N><C-w>k")
vim.cmd("inoremap <A-l> <C-\\><C-N><C-w>l")
vim.cmd("nnoremap <A-h> <C-w>h")
vim.cmd("nnoremap <A-j> <C-w>j")
vim.cmd("nnoremap <A-k> <C-w>k")
vim.cmd("nnoremap <A-l> <C-w>l")
vim.cmd('autocmd BufNewFile *.cpp 0r /home/talkysafe143/Desktop/CarpetaSebastian/TrabajosVirtuales/Universidad/IngSistemas/ACM/Codeforces/template.cpp')
vim.cmd [[ 
function! CompileAndRun()
  let fileName = expand('%')
  if fileName =~ '\.cpp$'
    let exeName = substitute(fileName, '\.cpp$', '', '')
    execute 'w | !g++ -Wall -DDEBUG -Wextra -Wconversion -static -DONLINE_JUDGE -O2 -std=c++23 "'. fileName . '" -o "' . exeName . '"'
    let pref = ''
    if exeName[0] != '/'
        let pref = './'
    endif
    if v:shell_error == 0
      let cmd = "x-terminal-emulator -e bash -c '" . pref . "" . exeName . "; read -p \"Press enter to exit...\"'"
      call system(cmd)
      redraw!
    endif
  else
    echo 'Not a C++ file'
  endif
endfunction
]]
vim.cmd('set splitbelow');
vim.cmd('map <F9> :w<CR>:!clear<CR>:call CompileAndRun()<CR>')
vim.cmd("map <C-t> :sp +term<CR>i")
