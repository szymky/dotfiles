require("nvchad.configs.lspconfig").defaults()

vim.lsp.config("pyright", {
  cmd = { "uv", "run", "pyright-langserver", "--stdio" },

  root_markers = { "pyproject.toml", ".git" },
})

local servers = {
  "html",
  "cssls",
  "pyright",
  "clangd",
  "zls",
  "svelte",
  "tailwindcss",
  "ts_ls",
  "texlab"
}

vim.lsp.enable(servers)


-- read :h vim.lsp.config for changing options of lsp servers 
