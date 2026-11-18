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

-- Setup clangd LSP server.
vim.lsp.config.clangd = {
  cmd = { 'clangd' , '--rename-file-limit=0' },
  root_markers = { 'compile_commands.json' },
  filetypes = { 'c', 'cpp', 'objcpp' },
}
vim.lsp.enable({'clangd'})

-- Do not show diagnostic signs next to line numbers.
vim.diagnostic.config({signs = false})

vim.api.nvim_set_hl(0, '@lsp.mod.deprecated', {})
vim.api.nvim_set_hl(0, '@lsp.type.comment.cpp', {})

-- Format on save using clang-format through the clangd LSP server.
vim.api.nvim_create_autocmd("BufWritePre", {
  group = clang_format_group,
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Format on save using clang-format for GLSL and OSL files.
-- Those are not covered by clangd LSP above.
vim.cmd([[
" Define a function that formats the current buffer using
" clang-format as a filter while retaining the window view.
function ClangFormat()
  let l:lines = "all"
  py3f /usr/share/clang/clang-format.py
endfunction

" Format current buffer using clang-format upon saving.
augroup clangformat
autocmd BufWritePre *.glsl,*.osl call ClangFormat()
augroup END
]])
