local leap = require('leap')

vim.keymap.set({'n', 'x', 'o'}, 'm', '<Plug>(leap-forward)')

vim.keymap.set({'n', 'x', 'o'}, 'M', '<Plug>(leap-backward)')

