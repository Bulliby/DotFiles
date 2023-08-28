vim.cmd([[
  augroup PhpactorMappings
  au!
  au FileType php nmap <buffer> <Leader>rr :PhpactorContextMenu<CR>
  augroup END
]])
