-- Show line numbers.
vim.o.number = true
-- Set the line number to the distance to the active line.
vim.o.relativenumber = true
-- Highlight active line.
vim.o.cursorline = true
-- Make sure at least 3 lines are shown past the active line.
vim.o.scrolloff = 3
-- Enable terminal true colors.
vim.o.termguicolors = true
-- Disable code folding.
vim.o.foldenable = false
-- Set the width of a tab to be equivalent to 2 spaces.
vim.o.tabstop = 2
-- Add 2 spaces when indenting.
vim.o.shiftwidth = 2
-- Expand tabs into spaces.
vim.o.expandtab = true
-- Make :find search recursively.
vim.o.path = vim.o.path .. ",**"
-- Enable rc files.
vim.o.exrc = true
-- Disable unsafe command in rc files.
vim.o.secure = true
-- Enable persistent undo.
vim.o.undofile = true
-- Set undo directory.
vim.o.undodir = vim.fn.expand("~/.cache/nvim/undodir")
-- Show hidden characters.
vim.o.list = true
-- Use ripgrep as the default grep program.
vim.o.grepprg = "rg -S --vimgrep"
-- Enable spelling.
vim.o.spell = true

-- Set color scheme to Nord.
vim.cmd.colorscheme("nord")

-- Remove banner from netrw.
vim.g.netrw_banner = 0
-- Use XDG cache path for netrw files.
vim.g.netrw_home = vim.fn.expand("~/.cache/nvim")
-- Set default *.tex flavor to LaTeX.
vim.g.tex_flavor = "latex"

vim.cmd([[
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
]])
