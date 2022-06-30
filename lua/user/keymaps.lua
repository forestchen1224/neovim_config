--Remap space as leader key
--vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.g.mapleader = '\\'
vim.g.maplocalleader = ''
local opts = { noremap = true, silent = true }
----Remap for dealing with word wrap
--vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
--vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true )
vim.keymap.set('n', '<F4>', function() return require 'nvim-tree'.toggle(false, true) end, opts)

-- debug
--vim.keymap.set("n", "<leader>db", require'dap'.toggle_breakpoint, opts)
--vim.keymap.set("n", "<leader>dB", function() return require'dap'.set_breakpoint(vim.fn.input '[Condition] > ') end, opts)
--vim. keymap.set("n", "<leader>dr", require'dap'.repl.open, opts)
--vim.keymap.set("n", "<F9>", require'dap'.run_last, opts)
--vim.keymap.set("n", "<F4>", require'dap'.terminate, opts)
--vim.keymap.set("n", "<F5>", require'dap'.continue, opts)
--vim.keymap.set("n", "<F6>", require'dap'.step_over, opts)
--vim.keymap.set("n", "<F7>", require'dap'.step_into, opts)
--vim.keymap.set("n", "<F8>", require'dap'.step_out, opts)
----vim.keymap.set("n", "K", require'dapui'.eval, opts)

-- telescope key bind
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers)
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').git_files)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').current_buffer_fuzzy_find)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags)
vim.keymap.set('n', '<leader>ft', require('telescope.builtin').tags)
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').grep_string)
vim.keymap.set('n', '<leader>fp', require('telescope.builtin').live_grep)
vim.keymap.set('n', '<leader>fo', function()
    require('telescope.builtin').tags { only_current_buffer = true }
end)
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles)

-- symbols-outline
vim.keymap.set('n', '<leader>o', require('symbols-outline').toggle_outline, opts)
