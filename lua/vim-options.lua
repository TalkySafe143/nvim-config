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
vim.cmd("set showtabline=0")
vim.cmd("set incsearch")
vim.cmd("set shellslash")
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set cino+=L0")
vim.cmd("tnoremap <Esc> <C-\\><C-n>")
vim.cmd('map <C-a> <esc>ggVG"+y<CR>')

vim.cmd("nnoremap k kzz")
vim.cmd("nnoremap j jzz")

vim.cmd("nnoremap <leader>j <C-w>j")
vim.cmd("nnoremap <leader>k <C-w>k")
vim.cmd("nnoremap <leader>l <C-w>l")
vim.cmd("nnoremap <leader>h <C-w>h")

vim.cmd('autocmd BufNewFile *.cpp 0r $TEMPLATE_PATH/template.cpp')
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
      let cmd = "kitty -e bash -c '" . pref . "" . exeName . "; read -p \"Press enter to exit...\"'"
      call system(cmd)
      redraw!
    endif
  else
    echo 'Not a C++ file'
  endif
endfunction
]]
vim.cmd('set splitbelow');
vim.cmd('map <leader>rr :w<CR>:!clear<CR>:call CompileAndRun()<CR>')
vim.cmd("map <leader>tt :sp +term<CR>i")
