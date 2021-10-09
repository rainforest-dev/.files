local vim = vim
local fn = vim.fn
local api = vim.api
local completion = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

vim.o.completeopt = "menuone,noinsert"

local _has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- [reference](https://github.com/mjlbach/defaults.nvim/blob/master/init.lua)
completion.setup({
	documentation = {
		border = { "🭽", "▔", "🭾", "▕", "🭿", "▁", "🭼", "▏" },
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<UP>"] = completion.mapping.close(),
		["<DOWN>"] = completion.mapping.close(),
		["<C-p>"] = completion.mapping.select_prev_item(),
		["<C-n>"] = completion.mapping.select_next_item(),
		["<C-d>"] = completion.mapping.scroll_docs(-4),
		["<C-f>"] = completion.mapping.scroll_docs(4),
		["<C-Space>"] = completion.mapping.complete(),
		["<C-e>"] = completion.mapping.close(),
		["<CR>"] = completion.mapping.confirm({
			behavior = completion.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = completion.mapping(function(fallback)
			if completion.visible() then
				completion.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				fn.feedkeys(api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
			elseif _has_words_before() then
				completion.complete()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
		["<S-Tab>"] = completion.mapping(function(fallback)
			if completion.visible() then
				completion.select_prev_item()
			elseif luasnip.jumpable(-1) then
				fn.feedkeys(api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	formatting = {
		format = lspkind.cmp_format({ with_text = true }),
	},
	experimental = {
		native_menu = true,
		ghost_text = false,
	},
	sources = {
		{ name = "buffer" },
		{ name = "path" },
		{ name = "calc" },
		{ name = "emoji" },
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
})
