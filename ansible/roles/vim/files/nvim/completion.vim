set completeopt=menuone,noinsert,noselect

lua <<EOF
    local cmp = require'cmp'
    local lspkind = require('lspkind')

    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["UltiSnips#Anon"](args.body)
            end,
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'ultisnips' },
        }, {
            { name = 'buffer' },
        }),
        
        mapping = cmp.mapping.preset.insert({
            ['<CR>'] = cmp.mapping.confirm({ select = true }), 
            ['<C-Space>'] = cmp.mapping.complete(),
        }),
        formatting = {
            format = lspkind.cmp_format({
                maxwidth = 50,
                ellipsis_char = '...',
                show_labelDetails = true,
            }),
        },
    })
EOF
