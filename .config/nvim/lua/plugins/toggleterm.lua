return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup({
                open_mapping = [[<C-\>]],
                hide_numbers = true,
                direction = "float",
                float_opts = {
                    border = "curved"
                },
                autochdir = true
            })
            local opts = {buffer = 0}
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        end
    }
}
