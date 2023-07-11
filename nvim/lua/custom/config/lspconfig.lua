local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local lspconfig = require "lspconfig"
local servers = { "tsserver", "intelephense", "sqlls", "rust_analyzer", "volar" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

