local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
    local keymap = vim.keymap.set
    local opts = {
      noremap = true,
      silent = true,
      buffer = bufnr
    }
    keymap("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts) -- goto definition
    keymap("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts) -- goto definition
    keymap("n", "<leader>gS", "<cmd>vsplit | Lspsaga goto_definition<CR>", opts) -- goto definition in split
    keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts) -- Code actions
    keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts) -- Rename symbol
    keymap("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts) -- Line diagnostics (float)
    keymap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts) -- Cursor diagnostics
    keymap("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts) -- previous diagnostic
    keymap("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts) -- next diagnostic
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts) -- hover documentation

end


lspconfig.lua_ls.setup({
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            vim.fn.expand("$VIMRUNTIME/lua"),
            vim.fn.expand("$XDG_CONFIG_HOME") .. "/nvim/lua"
          }
        }
      }
    }


})
