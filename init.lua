-- init.lua (entry point for Neovim configuration in Lua)

-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Set Leader key early
vim.g.mapleader = " "

-- Load lazy.nvim
require("lazy").setup("plugins")


-- Import configurations
require("vars")    -- Variables
require("opts")    -- Options
require("keys")    -- Keybindings
require("plugins") -- Keybindings

-- Load colorscheme
require("kanagawa").setup({
    keywordStyle = { italic = false, bold = true }
})
vim.cmd("colorscheme kanagawa")

-- Highlight colors
vim.cmd([[
hi CursorLineNr guifg=#7e9cd8
hi FoldColumn guifg=#29292c guibg=#26292c
hi GitSignsAdd guibg=#193549 guifg=#3ad900
hi GitSignsChange guibg=#193549 guifg=#ffc600
hi GitSignsDelete guibg=#193549 guifg=#ff2600
hi ColorColumn guifg=NONE guibg=#204563 gui=NONE
]])

-- Lualine Setup
require("lualine").setup {
    options = {
        theme = "kanagawa",
        fmt = string.lower,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
    }
}

-- Web-Dev-Icons
require("nvim-web-devicons").setup {
    color_icons = true,
    default = true,
}

-- Symbols Outline (Tagbar alternative)
require("symbols-outline").setup {
    show_guides = false,
    position = 'left',
    width = 35,
    wrap = false,
    keymaps = { fold = "h", unfold = "l", fold_all = "zM", unfold_all = "zR" },
}

-- Better Escape
-- lua, default settings
require("better_escape").setup {
    timeout = vim.o.timeoutlen,
    default_mappings = true,
    mappings = {
        i = {
            j = {
                -- These can all also be functions
                k = "<Esc>",
                j = "<Esc>",
            },
        },
        c = {
            j = {
                k = "<Esc>",
                j = "<Esc>",
            },
        },
        t = {
            j = {
                k = "<C-\\><C-n>",
            },
        },
        v = {
            j = {
                k = "<Esc>",
            },
        },
        s = {
            j = {
                k = "<Esc>",
            },
        },
    },
}

-- Terminal Integration
require('FTerm').setup({
    border     = 'single',
    cmd        = os.getenv('SHELL'),
    blend      = 0,
    dimensions = { height = 0.9, width = 0.9 },
})
vim.keymap.set('n', 't', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')


-- Hop (Easy Motion Alternative)
require("hop").setup { keys = "etovxqpdygfblzhckisuran" }

-- Indent Lines
vim.cmd [[
highlight IndentBlanklineIndent1 guifg=#2d3033 gui=nocombine
highlight IndentBlanklineIndent2 guifg=#2d3033 gui=nocombine
]]
require("ibl").setup {
    enabled = true,
    whitespace = { highlight = { "Whitespace", "NonText" } },
    scope = { enabled = true, show_start = true, highlight = { "Function", "Label" }, priority = 500 }
}

-- Todo Comments
require('todo-comments').setup {
    colors = {
        error = { "DiagnosticError", "ErrorMsg", "#de5d68" },
        warning = { "DiagnosticWarning", "WarningMsg", "#eeb927" },
        info = { "DiagnosticInfo", "#57a5e5" },
        hint = { "DiagnosticHint", "#bb70d2" },
        default = { "Identifier", "#de5d68" },
    },
}

-- Nvim Tree Setup
require("nvim-tree").setup {
    sort_by = "case_sensitive",
    renderer = { group_empty = true, icons = { git_placement = "after" } },
    filters = { dotfiles = false },
    git = { ignore = false },
}

-- LSP Configuration
local lspconfig = require("lspconfig")

-- Lua Language Server
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = { version = 'Lua 5.4' },
            diagnostics = { globals = { 'vim' } },
        }
    }
}

-- Rust Tools
local rt = require("rust-tools")
rt.setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
})

-- Additional LSP Configurations
lspconfig.texlab.setup({})
lspconfig.marksman.setup({})
lspconfig.grammarly.setup({})
