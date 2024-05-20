-- Mason interface --
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "jdtls",
    }
})

-- LSP autocompletion engine --
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Telescope configs --
require("telescope").setup {}

-- LSP configurations --
local on_attach = function(_,_)
end

-- Setup language servers --
local lspconfig = require('lspconfig')

lspconfig.jdtls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        },
    }
}

lspconfig.clangd.setup {
    on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
    end,
    -- cmd = { "/opt/homebrew/opt/llvm/bin/clangd", "--background-index" },
    -- root_dir = lspconfig.util.root_pattern("compile_commands.json", ".clangd"),
    -- cmd = {"clangd", "--std=c++20"},
    capabilities = capabilities,
}

lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

