-- plugins.lua (Complete Plugin management using lazy.nvim)

return {
    -- UI Enhancements
    {
        "rebelot/kanagawa.nvim",
        config = function()
            require("kanagawa").setup({
                keywordStyle = { italic = false, bold = true }
            })
            vim.cmd("colorscheme kanagawa")
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = { theme = "kanagawa" } })
        end
    },
    { "kyazdani42/nvim-web-devicons" },
    { "lukas-reineke/indent-blankline.nvim", config = function() require("ibl").setup() end },
    { "folke/todo-comments.nvim",            config = function() require("todo-comments").setup() end },
    { "glepnir/dashboard-nvim" },

    -- Navigation & Search
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup()
        end
    },
    { "phaazon/hop.nvim",      config = function() require("hop").setup() end },

    -- Syntax Highlighting & Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({ ensure_installed = "all", highlight = { enable = true } })
        end
    },
    { "p00f/nvim-ts-rainbow" },
    { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup() end },

    -- LSP & Completion
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lspconfig").lua_ls.setup({
                settings = { Lua = { diagnostics = { globals = { "vim" } } } } })
        end
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip" },
        config = function()
            require("cmp").setup()
        end
    },
    { "glepnir/lspsaga.nvim" },
    { "jose-elias-alvarez/null-ls.nvim" },
    { "williamboman/mason.nvim",           config = function() require("mason").setup() end },
    { "williamboman/mason-lspconfig.nvim", config = function() require("mason-lspconfig").setup() end },
    { "ray-x/lsp_signature.nvim" },
    { "simrat39/rust-tools.nvim" },
    {
        "j-hui/fidget.nvim",
        event = "LspAttach", -- Load when an LSP attaches
        config = function()
            require("fidget").setup({
                -- Enable progress notifications for LSP
                progress = {
                    display = {
                        done_icon = "✔", -- Custom icon for completed tasks
                    },
                },
            })
        end
    },

    -- Git Integration
    { "lewis6991/gitsigns.nvim",       config = function() require("gitsigns").setup() end },
    { "sindrets/diffview.nvim" },

    -- File Explorer & Management
    { "kyazdani42/nvim-tree.lua",      config = function() require("nvim-tree").setup() end },
    { "mbbill/undotree" },
    { "folke/trouble.nvim",            config = function() require("trouble").setup() end },
    { "simrat39/symbols-outline.nvim", config = function() require("symbols-outline").setup() end },

    -- Debugging & Productivity
    { "puremourning/vimspector" },
    { "numToStr/Comment.nvim",         config = function() require("Comment").setup() end },
    { "akinsho/toggleterm.nvim",       config = function() require("toggleterm").setup() end },
    { "folke/which-key.nvim",          config = function() require("which-key").setup() end },
    {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end,
    },
    -- Markdown & Writing
    { "nvim-orgmode/orgmode" },
    { "lukas-reineke/headlines.nvim", config = function() require("headlines").setup() end },
    {
        "nvim-neorg/neorg",
        dependencies = { "nvim-lua/plenary.nvim" }, -- Neorg requires plenary.nvim
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},  -- Load default settings
                    ["core.concealer"] = {}, -- Better UI
                    ["core.dirman"] = {      -- Manage directories
                        config = {
                            workspaces = {
                                notes = "~/neorg/notes",
                            },
                            default_workspace = "notes",
                        },
                    },
                },
            })
        end,
    },

    -- Miscellaneous
    { "folke/zen-mode.nvim", config = function() require("zen-mode").setup() end },
    { "folke/twilight.nvim", config = function() require("twilight").setup() end },
    {
        "numToStr/FTerm.nvim",
        config = function()
            require("FTerm").setup({
                border = "single",
                cmd = os.getenv("SHELL"),
                blend = 0,
                dimensions = {
                    height = 0.9,
                    width = 0.9,
                },
            })
        end
    },

}
