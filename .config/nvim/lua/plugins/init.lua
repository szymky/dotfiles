return {
    {
      "stevearc/conform.nvim",
      opts = require "configs.conform",
    },

    {
      "neovim/nvim-lspconfig",
      config = function()
        require "configs.lspconfig"
      end,
    },


    {
      'mrcjkb/rustaceanvim',
      version = '^8',
      lazy = false,
      ft = "rust",
      config = function()
        local mason_registry = require('mason-registry')
        local codelldb = mason_registry.get_package("codelldb")
        local extension_path = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/"
        local codelldb_path = extension_path .. "adapter/codelldb"
        local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
        local cfg = require('rustaceanvim.config')

        vim.g.rustaceanvim = {
          dap = {
            adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
          },
        }
      end
    },

    {
      'rust-lang/rust.vim',
      ft = "rust",
      init = function ()
        vim.g.rustfmt_autosave = 1
      end
    },

    {
      'mfussenegger/nvim-dap',
      config = function()
        local dap, dapui = require("dap"), require("dapui")
        dap.listeners.before.attach.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
          dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
          dapui.close()
        end
      end,
    },

    {
      'rcarriga/nvim-dap-ui',
      dependencies = {
        "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"
      },
      config = function()
        require("dapui").setup()
      end,
    },


    {
      "nvim-treesitter/nvim-treesitter",
      opts = function (_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        vim.list_extend(opts.ensure_installed, {"python", "toml", "json", "yaml", "markdown", "rust", "go", "make"})
      end,
    },

    {
      'nvim-telescope/telescope.nvim',
      version = '*',
      dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },

    {
        "NeogitOrg/neogit",
        lazy=true,
        dependencies={
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        cmd = "Neogit",
    },


  }

}
