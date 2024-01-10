call plug#begin()

   Plug 'nvim-treesitter/nvim-treesitter'
   Plug 'sindrets/diffview.nvim'
   Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
   Plug 'rebelot/kanagawa.nvim'
   Plug 'wbthomason/packer.nvim'
   Plug 'xiyaowong/nvim-transparent' 
   Plug 'simrat39/symbols-outline.nvim'
   Plug 'wbthomason/packer.nvim' 
   Plug 'windwp/nvim-autopairs'
   Plug 'max397574/better-escape.nvim'
   Plug 'jose-elias-alvarez/null-ls.nvim'
   Plug 'williamboman/mason-lspconfig.nvim'
   Plug 'tanvirtin/monokai.nvim' 
   Plug 'kyazdani42/nvim-tree.lua' 
   Plug 'nvim-lualine/lualine.nvim'
   Plug 'lewis6991/impatient.nvim'
   Plug 'tpope/vim-surround'
   Plug 'phaazon/hop.nvim'
   Plug 'onsails/lspkind.nvim'
   Plug 'lukas-reineke/headlines.nvim'
   Plug 'j-hui/fidget.nvim', { 'tag': 'legacy' }
   Plug 'L3MON4D3/LuaSnip'
   Plug 'saadparwaiz1/cmp_luasnip'
   Plug 'RRethy/vim-illuminate'
   Plug 'lukas-reineke/indent-blankline.nvim'
   Plug 'numToStr/Comment.nvim'
   Plug 'folke/trouble.nvim'
   Plug 'folke/todo-comments.nvim'
   Plug 'nvim-telescope/telescope.nvim'
   Plug 'nvim-telescope/telescope-media-files.nvim'
   Plug 'numToStr/FTerm.nvim'
   Plug 'BurntSushi/ripgrep'
   Plug 'sharkdp/fd'
   Plug 'neovim/nvim-lspconfig'
   Plug 'hrsh7th/nvim-cmp'
   Plug 'hrsh7th/cmp-nvim-lua'
   Plug 'hrsh7th/cmp-nvim-lsp'
   Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
   Plug 'hrsh7th/cmp-vsnip'
   Plug 'hrsh7th/cmp-path'
   Plug 'hrsh7th/cmp-buffer'
   Plug 'simrat39/inlay-hints.nvim'
   Plug 'simrat39/rust-tools.nvim'
   Plug 'saecki/crates.nvim'
   Plug 'hrsh7th/vim-vsnip'
   Plug 'nvim-lua/popup.nvim'
   Plug 'nvim-treesitter/nvim-treesitter'
   Plug 'm-demare/hlargs.nvim'
   Plug 'nvim-lua/plenary.nvim'
   Plug 'williamboman/mason.nvim'
   Plug 'puremourning/vimspector'
   Plug 'mfussenegger/nvim-dap'
   Plug 'kevinhwang91/nvim-ufo'
   Plug 'kevinhwang91/promise-async'
   Plug 'epwalsh/obsidian.nvim'
   Plug 'nvim-tree/nvim-web-devicons'
call plug#end()

lua require('start')
