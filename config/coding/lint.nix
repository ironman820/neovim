{
  plugins.lint = {
    enable = true;
    autoCmd = {
      callback = {
        __raw = ''
          function()
            local timer = vim.loop.new_timer()
            return function(...)
              local argb = { ... }
              timer:start(100, 0, function()
                timer:stop()
                vim.schedule_wrap(
                  function()
                    local nv_lint = require("lint")
                    local names = nv_lint._resolve_linter_by_ft(vim.bo.filetype)
                    if #names == 0 then
                      vim.list_extend(names, nv_lint.linters_by_ft["_"] or {})
                    end
                    vim.list_extend(names, nv_lint.linters_by_ft["*"] or {})
                    local ctx = { filename = vim.api.nvim_but_get_name(0)}
                    ctx.dirname = vim.fn.fnamemodify(ctx.filename, ":h")
                    if #names > 0 then
                      nv_lint.try_lint(names)
                    end
                  end
                )(unpack(argv))
              end)
            end
          end
        '';
      };
      event = ["BufWritePost" "BufReadPost" "InsertLeave"];
    };
    lintersByFt = {
      nix = ["statix"];
      python = ["pylint"];
    };
  };
}
