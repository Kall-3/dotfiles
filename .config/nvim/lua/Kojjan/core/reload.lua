function _G.ReloadConfig()
    local reloaded = false
    for name,_ in pairs(package.loaded) do
        if name:match('^Kojjan') and not name:match('^nvim-tree') then
            package.loaded[name] = nil
            reloaded = true
        end
    end

    if not reloaded then
        vim.notify("Nothing to reload", vim.log.levels.INFO)
    else
        dofile(vim.env.MYVIMRC)
        vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
    end
end
