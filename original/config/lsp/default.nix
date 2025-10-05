{
  plugins.none-ls = {
    enable = true;
    # enableLspFormat = true;
    sources = {
      diagnostics = {
        # flake8.enable = true;
        # luacheck.enable = true;
        statix.enable = true;
      };
      # formatting = {
      #   trim_newlines.enable = true;
      #   trim_whitespace.enable = true;
      # };
    };
  };
}
# local neodev_ok, neodev = pcall(require, "neodev")
# if neodev_ok then
#   neodev.setup({})
# end
# local keys = vim.keymap
# local buffer = vim.lsp.buf
# local opts = {
#   diagnostics = {
#     underline = true,
#     update_in_insert = false,
#     virtual_text = {
#       spacing = 4,
#       source = "if_many",
#       prefix = "●",
#     },
#     severity_sort = true,
#   },
#   flags = {
#     debounce_text_changes = 500,
#   },
#   inlay_hints = {
#     enabled = false,
#   },
#   capabilities = {},
#   format = {
#     formatting_options = nil,
#     timeout_ms = nil,
#   },
#   on_attach = function(client, bufnr)
#     keys.set("n", "K", buffer.hover, { desc = "Enable hover definitions" })
#     keys.set("n", "gd", buffer.definition, { desc = "Goto definition" })
#     keys.set("n", "gr", buffer.references, { desc = "Goto references" })
#     keys.set("n", "gD", buffer.declaration, { desc = "Goto declaration" })
#     keys.set("n", "gI", buffer.implementation, { desc = "Goto implimentation" })
#     keys.set("n", "<leader>cD", "<cmd>Telescope diagnostics<cr>", { desc = "Open Diagnostics list" })
#     keys.set("n", "<leader>cl", "<Cmd>LspInfo<CR>", { desc = "Open LSP Info" })
#     keys.set("n", "<leader>cL", "<cmd>LspLog<cr>", { desc = "Open LSP [L]og" })
#     if client.server_capabilities["documentSymbolProvider"] then
#       require("nvim-navic").attach(client, bufnr)
#     end
#   end,
#   servers = {
#     lua_ls = {
#       mason = false, -- set to false if you don't want this server to be installed with mason
#       settings = {
#         Lua = {
#           completion = {
#             callSnippet = "Replace",
#           },
#           diagnostics = {
#             globals = { "vim" },
#           },
#           workspace = {
#             checkThirdParty = false,
#             library = {
#               [vim.env.VIMRUNTIME] = true,
#               [vim.fn.expand("$VIMRUNTIME/lua")] = true,
#               [vim.fn.stdpath("config") .. "/lua"] = true,
#               -- ["${3rd}/luv/library"] = true,
#             },
#           },
#         },
#       },
#     },
#     nil_ls = {
#       mason = false,
#       settings = {},
#     },
#     pyright = {
#       mason = false,
#       settings = {},
#     },
#     psalm = {
#       cmd = { "psalm", "--language-server" },
#       mason = false,
#       root_dir = lspconfig.util.root_pattern(".git"),
#       settings = {},
#     },
#     taplo = {
#       mason = false,
#       settings = {},
#     },
#   },
#   settings = {},
#   setup = {
#   },
# }
# local neoconf_ok, neoconf = pcall(require, "neoconf")
# if neoconf_ok then
#   neoconf.setup()
# end
#
# local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
# for name, icon in pairs(signs) do
#   name = "DiagnosticSign" .. name
#   vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
# end
#
# vim.diagnostic.config(vim.deepcopy(opts.diagnostics))
#
# local servers = opts.servers
# local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
# local capabilities = vim.tbl_deep_extend(
#   "force",
#   {},
#   vim.lsp.protocol.make_client_capabilities(),
#   has_cmp and cmp_nvim_lsp.default_capabilities() or {},
#   opts.capabilities or {}
# )
#
# local function setup(server)
#   local server_opts = vim.tbl_deep_extend("force", opts, {
#     capabilities = vim.deepcopy(capabilities),
#     servers = nil,
#     setup = nil,
#   }, servers[server] or {})
#
#   if opts.setup[server] then
#     if opts.setup[server](server, server_opts) then
#       return
#     end
#   elseif opts.setup["*"] then
#     if opts.setup["*"](server, server_opts) then
#       return
#     end
#   end
#   lspconfig[server].setup(server_opts)
# end
#
# local have_mason, mlsp = pcall(require, "mason-lspconfig")
# local all_mslp_servers = {}
# if have_mason then
#   all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
# end
#
# local ensure_installed = {} ---@type string[]
# for server, server_opts in pairs(servers) do
#   if server_opts then
#     server_opts = server_opts == true and {} or server_opts
#     -- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
#     if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
#       setup(server)
#     else
#       ensure_installed[#ensure_installed + 1] = server
#     end
#   end
# end
#
# if have_mason then
#   mlsp.setup({ ensure_installed = ensure_installed, handlers = { setup } })
# end

