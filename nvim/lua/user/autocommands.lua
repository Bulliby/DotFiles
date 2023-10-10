local types = {'BufNewFile', 'BufRead'}

for k,type in pairs(types) do
    vim.api.nvim_create_autocmd(type, {
        pattern = {'*.vue', '*.html', '*.twig', '*.blade'},
        desc = 'Desativate wrap on buffer like HTML who can easily have large width',
        command = 'setlocal nowrap'
    })
end
