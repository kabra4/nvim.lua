local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
}

for option, value in pairs(powershell_options) do
    vim.opt[option] = value
end

require("toggleterm").setup {
    size = function(term)
        if term.direction == "horizontal" then
            return 15
        elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
        end
    end,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shading_factor = -30,
    start_in_insert = true,
    persist_size = true,
    direction = 'float',
    close_on_exit = true,
    shell = vim.o.shell, -- Using the shell set in your earlier script
}

function _G.set_toggleterm_keymaps()
    -- Horizontal terminal with Alt-h
    vim.api.nvim_set_keymap("n", "<M-h>", ":ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })

    -- Vertical terminal with Alt-v
    vim.api.nvim_set_keymap("n", "<M-v>", ":ToggleTerm direction=vertical<CR>", { noremap = true, silent = true })

    -- Floating terminal with Alt-t
    vim.api.nvim_set_keymap("n", "<M-t>", ":ToggleTerm direction=float<CR>", { noremap = true, silent = true })

    -- Toggle all terminals
    vim.api.nvim_set_keymap("n", "<leader>ta", ":ToggleTermToggleAll<CR>", { noremap = true, silent = true })
end

set_toggleterm_keymaps()

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
