-- =============================================================================
-- BOOTSTRAP LAZY.NVIM (Plugin Manager)
-- =============================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set Leader Key immediately
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- =============================================================================
-- PLUGINS
-- =============================================================================
require("lazy").setup({
	"mason-org/mason.nvim", -- Installer for external tools (LSP/DAP)
	"neovim/nvim-lspconfig", -- Native LSP Config
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},

	"hrsh7th/nvim-cmp", -- Autocomplete Engine
	"hrsh7th/cmp-nvim-lsp", -- LSP source for cmp
	"hrsh7th/cmp-buffer", -- Buffer source
	"hrsh7th/cmp-path", -- Path source
	"L3MON4D3/LuaSnip", -- Snippet Engine (Required for CMP)
	"saadparwaiz1/cmp_luasnip",
	"mfussenegger/nvim-lint",

	-- THEMES
	{ "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
	-- {
	--     "zaldih/themery.nvim",
	--     lazy = false,
	--     config = function()
	--         require("themery").setup({
	--             -- themes = { "tokyonight", "kanagawa", "sonokai" }, -- Your list of installed colorschemes.
	--             themes = {
	--                 {
	--                     name = "Tokyonight Night",
	--                     colorscheme = "tokyonight-night",
	--                 },
	--                 {
	--                     name = "Tokyonight Storm",
	--                     colorscheme = "tokyonight-storm",
	--                 },
	--                 {
	--                     name = "Tokyonight Moon",
	--                     colorscheme = "tokyonight-moon",
	--                 },
	--                 {
	--                     name = "Sonokai",
	--                     colorscheme = "sonokai",
	--                 },
	--                 {
	--                     name = "Kanagawa Wave",
	--                     colorscheme = "kanagawa-wave",
	--                 },
	--                 {
	--                     name = "Kanagawa Dragon",
	--                     colorscheme = "kanagawa-dragon",
	--                 },
	--                 {
	--                     name = "Catppuccin Frappe",
	--                     colorscheme = "catppuccin-frappe",
	--                 },
	--                 {
	--                     name = "Catppuccin Macchiato",
	--                     colorscheme = "catppuccin-macchiato"
	--                 },
	--                 {
	--                     name = "Catppuccin Mocha",
	--                     colorscheme = "catppuccin-mocha",
	--                 },
	--                 {
	--                     name = "Everforest",
	--                     before = [[ vim.g.everforest_background = "medium" ]],
	--                     colorscheme = "everforest",
	--                 },
	--                 {
	--                     name = "Everforest Soft",
	--                     before = [[ vim.g.everforest_background = "soft" ]],
	--                     colorscheme = "everforest",
	--                 },
	--                 {
	--                     name = "Everforest Hard",
	--                     before = [[ vim.g.everforest_background = "hard" ]],
	--                     colorscheme = "everforest",
	--                 },
	--             }
	--         })
	--     end
	-- },
	-- { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
	-- { 'sainnhe/sonokai',       lazy = false, priority = 1000, },
	-- { "catppuccin/nvim",       lazy = false, priority = 1000 },
	-- { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
	-- { "sainnhe/everforest",    lazy = false, priority = 1000 },

	-- UI
	"nvim-tree/nvim-web-devicons", -- Icons
	"onsails/lspkind.nvim",
	"nvim-lualine/lualine.nvim", -- Replacement for lightline
	"lewis6991/gitsigns.nvim", -- Replacement for gitgutter
	{
		"nvim-tree/nvim-tree.lua", -- Replacement for NERDTree
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"lukas-reineke/indent-blankline.nvim", -- Indent guides
	"nvim-treesitter/nvim-treesitter", -- Better syntax highlighting (Context replacement)
	"nvim-treesitter/nvim-treesitter-context", -- Sticky header (Context.vim replacement)
	{ "romainl/vim-cool" },

	-- TABS & BUFFERS
	"alvarosevilla95/luatab.nvim", -- Custom tabline
	"j-morano/buffer_manager.nvim", -- Buffer manager
	"axkirillov/hbac.nvim", -- Auto-close unedited buffers
	"norcalli/nvim-colorizer.lua",

	-- TOOLS & UTILS
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	"numToStr/Comment.nvim", -- Replacement for vim-commentary

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				keymaps = {
					visual = "S", -- Visual Select + S to surround
				},
			})
		end,
	},

	{
		"gorbit99/codewindow.nvim", -- Minimap
		config = function()
			require("codewindow").setup({
				auto_enable = false,
				show_cursor = false,
			})
		end,
	},

	"stevearc/conform.nvim",
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown" },
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
	"iamcco/markdown-preview.nvim", -- Markdown preview
	"MeanderingProgrammer/render-markdown.nvim",
	"jiangmiao/auto-pairs",
	"ziglang/zig.vim", -- Zig
	"moll/vim-bbye",
	{
		"xzbdmw/colorful-menu.nvim", -- Colorful completion menu
		config = function()
			require("colorful-menu").setup({})
		end,
	},
	"mfussenegger/nvim-dap",
	"jay-babu/mason-nvim-dap.nvim", -- Installs debuggers automatically

	-- SESSION
	{
		"rmagatti/auto-session",
		opts = {
			auto_save_enabled = true,
			auto_restore_enabled = true,
			auto_session_suppress_dirs = { "~/", "~/.config", "~/Downloads", "/" },
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	{
		"3rd/image.nvim",
		build = false,
		opts = {
			backend = "kitty",
			processor = "magick_cli",
		},
	},
})

-- =============================================================================
-- GENERAL SETTINGS
-- =============================================================================
local opt = vim.opt

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.showtabline = 2
opt.cursorline = true
opt.showmode = false
opt.splitright = true
opt.wrap = false

vim.diagnostic.config({
	virtual_text = true, -- Show errors inline
	signs = true,
	underline = true,
	update_in_insert = false,
})

-- Tabs & Indent
opt.tabstop = 8
opt.shiftwidth = 4
opt.expandtab = true

-- System
opt.mouse = "a"
opt.hidden = true
-- opt.updatetime = 300
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.encoding = "utf-8"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Disable native vim completion spam
-- opt.complete:remove({ "i", "t" })

-- =============================================================================
-- KEYBINDINGS (General)
-- =============================================================================
local map = vim.keymap.set

-- Clipboard
map("v", "<C-y>", '"+y', { silent = true })
map("n", "<C-v>", '"+p', { silent = true })

-- Window Navigation (Ctrl + h/j/k/l)
map("n", "<C-h>", "<C-w>h", { desc = "Window Left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window Down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window Up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window Right" })

-- Buffer Navigation (J/K)
map("n", "J", ":bprevious<CR>", { desc = "Prev Buffer" })
map("n", "K", ":bnext<CR>", { desc = "Next Buffer" })

-- Buffer manager
map("n", "<leader>bs", function()
	require("buffer_manager.ui").toggle_quick_menu()
end, { desc = "Buffer Manager" })

-- Tab Navigation (H/L)
map("n", "H", ":tabprev<CR>", { desc = "Prev Tab" })
map("n", "L", ":tabnext<CR>", { desc = "Next Tab" })
map("n", "<C-t>", ":tabnew<CR>", { desc = "New Tab" })

-- File Tree (NERDTree -> NvimTree)
map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Tree" })

-- Telescope (Replacement for FZF/Ag)
local builtin = require("telescope.builtin")
map("n", "<leader>fs", builtin.find_files, { desc = "File Search" })
map("n", "<leader>ps", builtin.live_grep, { desc = "Pattern Search (Ag)" })

-- Minimap
map("n", "<leader>mm", function()
	require("codewindow").toggle_minimap()
end)

-- DEBUGGER
local dap = require("dap")
map("n", "<F5>", function()
	dap.continue()
end)
map("n", "<S-F5>", function()
	dap.terminate()
end)
map("n", "<F6>", function()
	dap.step_over()
end)
map("n", "<F8>", function()
	dap.step_into()
end)
map("n", "<F10>", function()
	dap.toggle_breakpoint()
end)

-- =============================================================================
-- PLUGIN CONFIGS
-- =============================================================================

require("gruvbox").setup({
	contrast = "hard",
	transparent_mode = true,
	bold = false,
	italic = {
		strings = false,
		emphasis = true,
		comments = true,
		operators = false,
		folds = true,
	},
	overrides = {
		DiagnosticUnnecessary = { link = "Comment" },
	},
})

vim.cmd("colorscheme gruvbox")

require("lualine").setup({
	options = { theme = "auto" },
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "searchcount", "diagnostics" },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})

require("luatab").setup({
	windowCount = function()
		return ""
	end,
})

require("colorizer").setup({})

require("nvim-tree").setup({
	view = { width = 30 },
	renderer = { group_empty = true },
	tab = { sync = { open = true, close = true } },
})

-- Auto close buffers
require("hbac").setup({
	autoclose = true,
	threshold = 10, -- Start closing when more than 10 buffers open
})

-- Treesitter (Syntax Highlighting)
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"zig",
		"c",
		"cpp",
		"make",
		"lua",
		"vim",
		"python",
		"javascript",
		"json",
		"markdown",
		"gitignore",
		"asm",
	},
	highlight = { enable = true },
})

-- =============================================================================
-- 6. LSP & AUTOCOMPLETION (The Core Replacement for CoC)
-- =============================================================================

-- Mason Setup (Installs clangd, pyright, etc. automatically)
require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = { "zls", "clangd", "lua_ls" },
})

require("mason-nvim-dap").setup({
	ensure_installed = { "codelldb" },
})

-- LSP Config
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup typescript
-- Setup Clangd (C/C++)
vim.lsp.config("clangd", {
	capabilities = capabilities,
	cmd = { "clangd", "--offset-encoding=utf-16" },
})
vim.lsp.enable("clangd")

-- Setup Lua
vim.lsp.config("lua_ls", {
	cmd = { "/usr/bin/lua-language-server" },
	root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
	filetypes = { "lua" },
	capabilities = capabilities,
})
vim.lsp.enable("lua_ls")

-- Setup Zig
vim.g.zig_fmt_parse_errors = 0 -- don't show parse errors in a separate window
vim.g.zig_fmt_autosave = 0 -- disable format-on-save from `ziglang/zig.vim`

vim.lsp.config("zls", {
	capabilities = capabilities,
	cmd = { vim.fn.expand("$HOME/Builds/zls/zig-out/bin/zls") },
	settings = {
		zls = {
			semantic_tokens = "partial",
		},
	},
})
vim.lsp.enable("zls")

-- GLOBAL LSP KEYMAPS
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		-- GoTo Navigation
		map("n", "gd", vim.lsp.buf.definition, opts)
		map("n", "gy", vim.lsp.buf.type_definition, opts)
		map("n", "gi", vim.lsp.buf.implementation, opts)
		map("n", "gr", vim.lsp.buf.references, opts)

		-- Diagnostics ([g / ]g)
		map("n", "<leader>g", vim.diagnostic.goto_next, opts)
		map("n", "<leader>G", vim.diagnostic.goto_prev, opts)

		-- Documentation (gh -> K)
		-- Native vim uses K by default for hover, mapping gh to it
		map("n", "gh", vim.lsp.buf.hover, opts)

		-- Inlay Hints (ih)
		map("n", "<leader>ih", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, opts)

		-- Organize Imports (Action)
		map("n", "<leader>or", vim.lsp.buf.code_action, opts)
	end,
})

-- COMPLETION SETUP (CMP)
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	preselect = cmp.PreselectMode.None,
	completion = {
		completeopt = "menu,menuone,noselect,noinsert",
	},

	window = {
		completion = cmp.config.window.bordered(), -- Optional: borders around the list
		documentation = cmp.config.enable, -- DISABLES the doc popups
	},

	formatting = {
		fields = { "kind", "abbr", "menu" },

		format = function(entry, vim_item)
			local kind = require("lspkind").cmp_format({
				mode = "symbol_text",
			})(entry, vim.deepcopy(vim_item))
			local highlights_info = require("colorful-menu").cmp_highlights(entry)

			-- highlight_info is nil means we are missing the ts parser, it's
			-- better to fallback to use default `vim_item.abbr`. What this plugin
			-- offers is two fields: `vim_item.abbr_hl_group` and `vim_item.abbr`.
			if highlights_info ~= nil then
				vim_item.abbr_hl_group = highlights_info.highlights
				vim_item.abbr = highlights_info.text
			end
			local strings = vim.split(kind.kind, "%s", { trimempty = true })
			vim_item.kind = " " .. (strings[1] or "") .. " "
			vim_item.menu = ""

			return vim_item
		end,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-Space>"] = cmp.mapping.complete(),

		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),

		-- S-TAB: Cycle Backwards
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),

		-- ENTER: Confirm selection (Insert text)
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
	}, {
		{ name = "buffer" },
	}),
})

-- =============================================================================
-- FORMATTING
-- =============================================================================
require("conform").setup({
	formatters = {
		["clang-format"] = {
			prepend_args = {
				"-style={BasedOnStyle: Google, ColumnLimit: 120, AllowShortIfStatementsOnASingleLine: true}",
			},
		},
	},

	formatters_by_ft = {
		zig = { "zigfmt" },
		c = { "clang-format" },
		lua = { "stylua" },
		cpp = { "clang-format" },
		json = { "prettierd" },
		javascript = { "prettierd" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})

-- Custom commands to build/run (Ported from vimrc)
vim.api.nvim_create_user_command("Build", 'execute "!cd build && make"', {})
vim.api.nvim_create_user_command("Run", 'execute "!find build -maxdepth 1 -executable -type f -exec {} \\;"', {})
