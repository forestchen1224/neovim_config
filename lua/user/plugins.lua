-- Install packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PackerBootstrap = vim.fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim', install_path })
end

local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost',
    { command = 'source <afile> | PackerCompile', group = packer_group, pattern = 'init.lua' })

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager
    use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
    use "williamboman/nvim-lsp-installer"
    use 'nvim-treesitter/nvim-treesitter'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    --use 'hrsh7th/vim-vsnip'
    --use 'hrsh7th/vim-vsnip-integ'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    --use 'jiangmiao/auto-pairs'
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use 'tpope/vim-fugitive' -- Git commands in nvim
    use 'ludovicchabant/vim-gutentags' -- Automatic tags management
    use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'mfussenegger/nvim-dap' }
    use { 'lukas-reineke/indent-blankline.nvim' }
    use { 'morhetz/gruvbox' }
    use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }
    use { 'simrat39/symbols-outline.nvim' }
    use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end}
    --use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
    --use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
    ---- UI to select things (files, grep results, open buffers...)
    --use 'mjlbach/onedark.nvim' -- Theme inspired by Atom
    ---- Add indentation guides even on blank lines
    ---- Add git related info in the signs columns and popups
    ---- Highlight, edit, and navigate code using a fast incremental parsing library
    ---- Additional textobjects for treesitter
    if PackerBootstrap then
        require('packer').sync()
    end
end)
