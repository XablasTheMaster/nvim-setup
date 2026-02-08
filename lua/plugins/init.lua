
return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on save
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
          require "configs.lspconfig"
        end,
    },

    -- mini-nvim
    {
        { "echasnovski/mini.ai", version = "*", opts = {} },
        { "echasnovski/mini.comment", version = "*", opts = {} },
        { "echasnovski/mini.move", version = "*", opts = {} },
        { "echasnovski/mini.surround", version = "*", opts = {} },
        { "echasnovski/mini.cursorword", version = "*", opts = {} },
        { "echasnovski/mini.indentscope", version = "*", opts = {} },
        { "echasnovski/mini.pairs", version = "*", opts = {} },
        { "echasnovski/mini.trailspace", version = "*", opts = {} },
        { "echasnovski/mini.bufremove", version = "*", opts = {} },
        { "echasnovski/mini.notify", version = "*", opts = {} },
    },

    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        config = function()
            -- Remove background color from the NvimTree window (ui fix)
            vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

            require("nvim-tree").setup({
                filters = {
                    dotfiles = false, -- Show hidden files (dotfiles)
                },
                view = {
                    adaptive_size = true,
                },
            })
        end,
    };

   {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        lazy = false,
        opts = {
            ensure_installed =  {
                "bash",
				"c",
				"cpp",
				"css",
				"dockerfile",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"rust",
				"svelte",
				"typescript",
				"vue",
				"yaml",
            },
            auto_install = true, -- auto-install any other parsers on opening new language files
			sync_install = false,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					scope_incremental = "<TAB>",
					node_decremental = "<S-TAB>",
				},
			},
        }
   },

   {
       "savq/melange-nvim",
       lazy = false,
       prioriry = 1000,
       config = function()
            vim.cmd("colorscheme melange")
       end

   },

   {
       "ibhagwan/fzf-lua",
       lazy = false,
       dependencies = { "nvim-tree/nvim-web-devicons" },
       keys = {
            {
                "<leader>ff",
                function()
                    require("fzf-lua").files()
                end,
                desc = "FZF Files",
            },
            {
                "<leader>fg",
                function()
                    require("fzf-lua").live_grep()
                end,
                desc = "FZF Live Grep",
            },
            {
                "<leader>fb",
                function()
                    require("fzf-lua").buffers()
                end,
                desc = "FZF Buffers",
            },
            {
                "<leader>fh",
                function()
                    require("fzf-lua").help_tags()
                end,
                desc = "FZF Help Tags",
            },
            {
                "<leader>fx",
                function()
                    require("fzf-lua").diagnostics_document()
                end,
                desc = "FZF Diagnostics Document",
            },
            {
                "<leader>fX",
                function()
                    require("fzf-lua").diagnostics_workspace()
                end,
                desc = "FZF Diagnostics Workspace",
            },
            {
                "<leader>fs",
                function()
                    require("fzf-lua").lsp_document_symbols()
                end,
                desc = "FZF Document Symbols",
            },
            {
                "<leader>fS",
                function()
                    require("fzf-lua").lsp_workspace_symbols()
                end,
                desc = "FZF Workspace Symbols",
            },
        },

        opts = {},
   },

     {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
    ft = "rust",
    config = function ()
      --local mason_registry = require('mason-registry')
      --local codelldb = mason_registry.get_package("codelldb")
   --   local extension_path = codelldb:get_install_path() .. "/extension/"
      --local codelldb_path = extension_path .. "adapter/codelldb"
   --   local liblldb_path = extension_path.. "lldb/lib/liblldb.dylib"
	-- If you are on Linux, replace the line above with the line below:
	 --local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
      --local cfg = require('rustaceanvim.config')

      --vim.g.rustaceanvim = {
        --dap = {
         -- adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
       -- },
     -- }
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
       "mfunssenegger/nvim-dap",
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
       dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
       config = function()
               require("dapui").setup()
       end,
   },

     {
    'saecki/crates.nvim',
    ft = {"toml"},
    config = function()
      require("crates").setup {
        completion = {
          cmp = {
            enabled = true
          },
        },
      }
      require('cmp').setup.buffer({
        sources = { { name = "crates" }}
      })
    end
  },

   -- test new blink
    -- { import = "nvchad.blink.lazyspec" },

    -- {
    -- 	"nvim-treesitter/nvim-treesitter",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"vim", "lua", "vimdoc",
    --      "html", "css"
    -- 		},
    -- 	},
    -- },
}
