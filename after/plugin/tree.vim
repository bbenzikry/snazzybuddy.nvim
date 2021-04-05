augroup SnazzyBuddyNvimTree
        au BufEnter * lua if vim.g.colors_name == 'snazzybuddy' then require('snazzybuddy').icon_load() end
augroup end