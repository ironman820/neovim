{
  extraConfigLuaPost = ''
    local i = {
      [" "] = "Whitespace",
      ['"'] = 'Balanced "',
      ["'"] = "Balanced '",
      ["`"] = "Balanced `",
      ["("] = "Balanced (",
      [")"] = "Balanced ) including white-space",
      [">"] = "Balanced > including white-space",
      ["<lt>"] = "Balanced <",
      ["]"] = "Balanced ] including white-space",
      ["["] = "Balanced [",
      ["}"] = "Balanced } including white-space",
      ["{"] = "Balanced {",
      ["?"] = "User Prompt",
      _ = "Underscore",
      a = "Argument",
      b = "Balanced ), ], }",
      c = "Class",
      f = "Function",
      o = "Block, conditional, loop",
      q = "Quote `, \", '",
      t = "Tag",
    }
    local a = vim.deepcopy(i)
    for k, v in pairs(a) do
      a[k] = v:gsub(" including.*", "")
    end

    local ic = vim.deepcopy(i)
    local ac = vim.deepcopy(a)
    for key, name in pairs({ n = "Next", l = "Last" }) do
      i[key] = vim.tbl_extend("force", { name = "Inside " .. name .. " textobject" }, ic)
      a[key] = vim.tbl_extend("force", { name = "Around " .. name .. " textobject" }, ac)
    end
    require("which-key").register({
        mode = { "o", "x" },
        i = i,
        a = a,
      })
  '';
  keymaps = [
    {
      key = "<leader>bd";
      action = ''
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
            if choice == 1 then -- Yes
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then -- No
              bd(0, true)
            end
          else
            bd(0)
          end
        end
      '';
      lua = true;
      options.desc = "Delete Buffer";
    }
    {
      key = "<leader>bD";
      action = ''
        function()
          require("mini.bufremove").delete(0, true)
        end
      '';
      lua = true;
      options.desc = "Delete Buffer (Force)";
    }
    {
      key = "<leader>ff";
      action = ''
        function()
          require("mini.files").open()
        end
      '';
      lua = true;
      options.desc = "Open Mini file explorer";
    }
  ];
  plugins.mini = {
    enable = true;
    modules = {
      ai = {
        n_lines = 500;
        custom_textobjects = {
          o = {
            __raw = ''
              require("mini.ai").gen_spec.treesitter({
                a = { "@block.outer", "@conditional.outer", "@loop.outer" },
                i = { "@block.inner", "@conditional.inner", "@loop.inner" },
              }, {})
            '';
          };
          f = {__raw = ''require("mini.ai").gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {})'';};
          c = {__raw = ''require("mini.ai").gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {})'';};
          t = ["<([%p%w]-)%f[^<%w][^<>]->.-</%1>" "^<.->().*()</[^/]->$"];
        };
      };
      bufremove = {};
      comment.options.custom_commentstring = {
        __raw = ''
          function()
            return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
          end
        '';
      };
      files = {};
      hipatterns.highlighters.hex_color = {__raw = ''require("mini.hipatterns").gen_highlighter.hex_color()'';};
      pairs = {};
      surround.mappings = {
        add = "sa";
        delete = "sd";
        find = "sf";
        find_left = "sF";
        highlight = "sh";
        replace = "sr";
        update_n_lines = "sn";
      };
    };
  };
}
