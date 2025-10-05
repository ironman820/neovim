local aerial = require("aerial")
---@diagnostic disable-next-line: undefined-global
local icons = vim.deepcopy(user_icons.kinds)
icons.lua = { Package = icons.Control }

local filter_kind = false
---@diagnostic disable-next-line: undefined-global
if user_util.kind_filter then
	---@diagnostic disable-next-line: cast-local-type, undefined-global
	filter_kind = assert(vim.deepcopy(user_util.kind_filter))
	filter_kind._ = filter_kind.default
	filter_kind.default = nil
end

local opts = {
	attach_mode = "global",
	backends = { "lsp", "treesitter", "markdown", "man" },
	show_guides = true,
	layout = {
		resize_to_content = false,
		win_opts = {
			winhl = "Normal:NormalFloat,FloatBorder:NormalFloat,SignColumn:SignColumnSB",
			signcolumn = "yes",
			statuscolumn = " ",
		},
	},
	icons = icons,
	filter_kind = filter_kind,
      -- stylua: ignore
      guides = {
        mid_item   = "├╴",
        last_item  = "└╴",
        nested_top = "│ ",
        whitespace = "  ",
      },
}

aerial.setup(opts)

local conceal = require("conceal")

conceal.setup({
	["lua"] = {
		enabled = true,
		keywords = {
			["and"] = {
				conceal = "󰪍",
			},
			["end"] = {
				conceal = "",
			},
			["function"] = {
				conceal = "󰊕",
			},
			["if"] = {
				conceal = "",
			},
			["local"] = {
				conceal = "󰼈",
			},
			["not"] = {
				conceal = "󰈅",
			},
			["require"] = {
				conceal = "",
			},
			["return"] = {
				conceal = "󱞴",
			},
		},
	},
	["python"] = {
		enabled = true,
		keywords = {
			["break"] = {
				conceal = "",
			},
			["class"] = {
				conceal = "",
			},
			["continue"] = {
				conceal = "󰈑",
			},
			["def"] = {
				conceal = "󰊕",
			},
			["del"] = {
				conceal = "󰊁",
			},
			["else"] = {
				conceal = "󰦼",
			},
			["for"] = {
				conceal = "󰆙",
			},
			["from_import"] = {
				conceal = "󰝰",
			},
			["if"] = {
				conceal = "",
			},
			["import"] = {
				conceal = "󰶮",
			},
			["not"] = {
				conceal = "󰈅",
			},
			["or"] = {
				conceal = "󰃻",
			},
			["return"] = {
				conceal = "󱞴",
			},
			["print"] = {
				conceal = "󰐪",
			},
			["while"] = {
				conceal = "󰖉",
			},
			["yield"] = {
				conceal = "",
			},
		},
	},
})

conceal.generate_conceals()

local hop = require("hop")
local directions = require("hop.hint").HintDirection
hop.setup()
---@diagnostic disable-next-line: undefined-global
local map = user_util.map
map("f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, { remap = true })
map("F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, { remap = true })
map("t", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })
map("T", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = -1 })
end, { remap = true })

require("spectre").setup({ open_cmd = "noswapfilevnew" })
