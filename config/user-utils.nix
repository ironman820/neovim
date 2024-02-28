{
  extraConfigLuaPre = ''
    local user_util = {}
    -- Function to find the git root directory based on the current buffer's path
    function user_util.find_root()
      -- Use the current buffer's path as the starting point for the git search
      local current_file = vim.api.nvim_buf_get_name(0)
      local current_dir
      local cwd = vim.fn.getcwd()
      -- If the buffer is not associated with a file, return nil
      if current_file == "" then
        current_dir = cwd
      else
        -- Extract the directory from the current file's path
        current_dir = vim.fn.fnamemodify(current_file, ":h")
      end

      -- Find the Git root directory from the current file's path
      local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
      if vim.v.shell_error ~= 0 then
        print("Not a git repository. Searching on current working directory")
        return cwd
      end
      return git_root
    end

    user_util.kind_filter = {
      default = {
        "Class",
        "Constructor",
        "Enum",
        "Field",
        "Function",
        "Interface",
        "Method",
        "Module",
        "Namespace",
        "Package",
        "Property",
        "Struct",
        "Trait",
      },
      markdown = false,
      help = false,
      -- you can specify a different filter for each filetype
      lua = {
        "Class",
        "Constructor",
        "Enum",
        "Field",
        "Function",
        "Interface",
        "Method",
        "Module",
        "Namespace",
        -- "Package", -- remove package since luals uses it for control flow structures
        "Property",
        "Struct",
        "Trait",
      },
    }

    function user_util.get_kind_filter(buf)
      buf = (buf == nil or buf == 0) and vim.api.nvim_get_current_buf() or buf
      local ft = vim.bo[buf].filetype
      if user_util.kind_filter == false then
        return
      end
      if user_util.kind_filter[ft] == false then
        return
      end
      ---@diagnostic disable-next-line: return-type-mismatch
      return type(user_util.kind_filter) == "table" and type(user_util.kind_filter.default) == "table" and user_util.kind_filter.default or nil
    end

    function user_util.map(lhs, rhs, options)
      local opts = options or {}
      local mode = opts.mode or ""
      opts.mode = nil
      vim.keymap.set(mode, lhs, rhs, opts)
    end
  '';
}
