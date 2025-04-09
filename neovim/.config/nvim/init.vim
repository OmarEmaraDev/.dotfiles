" Show line numbers.
set number
" Set the line number to the distance to the active line.
set relativenumber
" Highlight active line.
set cursorline
" Make sure at least 3 lines are shown past the active line.
set scrolloff=3
" Enable terminal true colors.
set termguicolors
" Set color scheme to Nord.
colorscheme nord
" Disable code folding.
set nofoldenable
" Set the width of a tab to be equivalent to 2 spaces.
set tabstop=2
" Add 2 spaces when indenting.
set shiftwidth=2
" Expand tabs into spaces.
set expandtab
" Make :find search recursively.
set path+=**
" Enable rc files.
set exrc
" Disable unsafe command in rc files.
set secure
" Enable persistent undo.
set undofile
" Set undo directory.
set undodir=~/.cache/nvim/undodir
" Show hidden characters.
set list
" Use ripgrep as the default grep program.
set grepprg=rg\ -S\ --vimgrep
" Enabling spelling.
set spell

" Define a function that formats the current buffer using
" clang-format as a filter while retaining the window view.
function ClangFormat()
  let l:lines = "all"
  py3f /usr/share/clang/clang-format.py
endfunction

" Format current buffer using clang-format upon saving.
augroup clangformat
autocmd BufWritePre *.c,*.h,*.cc,*.cpp,*.hpp,*.hh,*.mm,*.glsl,*.osl call ClangFormat()
augroup END

" Force GLSL files to have C syntax highlighting.
autocmd BufNewFile,BufRead *.glsl set filetype=c

" Remove banner from netrw.
let g:netrw_banner = 0

" Use XDG cache path for netrw files.
let g:netrw_home = "~/.cache/nvim"

" Set default *.tex flavor to LaTeX.
let g:tex_flavor = "latex"
