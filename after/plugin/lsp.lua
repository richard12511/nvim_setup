--local lsp_zero = require('lsp-zero')
--
--lsp_zero.on_attach(function(client, bufnr)
--  -- see :help lsp-zero-keybindings
--  -- to learn the available actions
--  lsp_zero.default_keymaps({buffer = bufnr})
--end)
--lsp_zero.setup()
--
--require('mason').setup({})
--require('mason-lspconfig').setup({
--	ensure_installed = {'tsserver','dockerls', 'eslint', 'gopls', 'lua_ls', 'ocamllsp', 'rust_analyzer'},
--	handlers = {
--		lsp_zero.default_setup
--	}
--})
--

 local lsp = require('lsp-zero')

 lsp.preset('recommended')

-- lsp.ensure_installed({
--	 'tsserver',
--	 'eslint',
--	 'sumneko_lua',
--	 'rust_analyzer',
--	 'gopls',
--	 'ocamllsp'
-- })

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-y>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

require("mason").setup()
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
lsp.setup_servers({'lua_ls', 'rust_analyzer', 'tsserver', 'gopls', 'ocamllsp'})
lsp.setup()
