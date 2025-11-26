-- Load NvChad defaults
require("nvchad.configs.lspconfig").defaults()

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "lua_ls",
    "html",
    "cssls",
    "clangd",
  },
  automatic_installation = true,
}

-- Enable servers with NvChad's wrapper
local servers = { "html", "cssls", "lua_ls", "clangd" }
vim.lsp.enable(servers)

-- Override clangd config specifically
vim.lsp.config.clangd = {
  cmd = {
    "clangd",
    "--clang-tidy",
    "--background-index",
    "--offset-encoding=utf-8",
  },
  root_markers = { ".clangd", "compile_commands.json", ".git" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
}
