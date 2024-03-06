{pkgs, ...}: {
  # Import all your configuration modules here
  imports = [
    ./catppuccin.nix
    ./coding
    ./editor
    ./lsp
    ./treesitter
    ./bufferline.nix
    ./extraPlugins.nix
    ./dap.nix
    ./user-icons.nix
    ./user-utils.nix
  ];
  config = {
    autoCmd = [
      {
        command = "checktime";
        group = "checktime";
        event = ["FocusGained" "TermClose" "TermLeave"];
      }
      {
        event = ["TextYankPost"];
        group = "highlight_yank";
        callback = {
          __raw = ''
            function()
              vim.highlight.on_yank()
            end
          '';
        };
      }
      {
        event = ["VimResized"];
        group = "resize_splits";
        callback = {
          __raw = ''
            function()
              local current_tab = vim.fn.tabpagenr()
              vim.cmd("tabdo wincmd =")
              vim.cmd("tabnext " .. current_tab)
            end
          '';
        };
      }
      {
        event = ["BufReadPost"];
        group = "last_loc";
        callback = {
          __raw = ''
            function(event)
              local exclude = { "gitcommit" }
              local buf = event.buf
              if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
                return
              end
              vim.b[buf].lazyvim_last_loc = true
              local mark = vim.api.nvim_buf_get_mark(buf, '"')
              local lcount = vim.api.nvim_buf_line_count(buf)
              if mark[1] > 0 and mark[1] <= lcount then
                pcall(vim.api.nvim_win_set_cursor, 0, mark)
              end
            end
          '';
        };
      }
      {
        event = ["FileType"];
        group = "close_with_q";
        pattern = [
          "PlenaryTestPopup"
          "help"
          "lspinfo"
          "man"
          "notify"
          "qf"
          "query"
          "spectre_panel"
          "startuptime"
          "tsplayground"
          "neotest-output"
          "checkhealth"
          "neotest-summary"
          "neotest-output-panel"
        ];
        callback = {
          __raw = ''
            function(event)
              vim.bo[event.buf].buflisted = false
              vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
            end
          '';
        };
      }
      {
        event = ["FileType"];
        group = "wrap_spell";
        pattern = ["gitcommit" "markdown"];
        callback = {
          __raw = ''
            function()
              vim.opt_local.wrap = true
              vim.opt_local.spell = true
            end
          '';
        };
      }
      {
        event = ["BufWritePre"];
        group = "auto_create_dir";
        callback = {
          __raw = ''
            function(event)
              if event.match:match("^%w%w+://") then
                return
              end
              local file = vim.loop.fs_realpath(event.match) or event.match
              vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
            end
          '';
        };
      }
    ];
    autoGroups = {
      checktime = {
        clear = true;
      };
      highlight_yank = {
        clear = true;
      };
      resize_splits = {
        clear = true;
      };
      last_loc = {
        clear = true;
      };
      close_with_q = {
        clear = true;
      };
      wrap_spell = {
        clear = true;
      };
      auto_create_dir = {
        clear = true;
      };
    };
    extraConfigLua = ''
      vim.opt.shortmess:append({ W = true, I = true, c = true, C = true })
    '';
    extraConfigLuaPre = ''
      local diagnostic_goto = function(next, severity)
        local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
        severity = severity and vim.diagnostic.severity[severity] or nil
        return function()
          go({ severity = severity })
        end
      end
    '';
    extraPackages = with pkgs; [
      alejandra
    ];
    extraPython3Packages = py:
      with py; [
        black
      ];
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      root_spec = [
        "lsp"
        [
          ".git"
          ".lua"
        ]
        "cwd"
      ];
      markdown_recommended_style = 0;
    };
    keymaps = [
      {
        action = "<Nop>";
        key = "q";
      }
      {
        action = "<esc>";
        key = "jk";
        options = {
          noremap = true;
          silent = true;
        };
        mode = "i";
      }
      {
        action = "<esc>";
        key = "kj";
        options = {
          noremap = true;
          silent = true;
        };
        mode = "i";
      }
      {
        action = "v:count == 0 ? 'gj' : 'j'";
        key = "j";
        options = {
          expr = true;
          silent = true;
        };
        mode = ["n" "x"];
      }
      {
        action = "v:count == 0 ? 'gj' : 'j'";
        key = "<Down>";
        options = {
          expr = true;
          silent = true;
        };
        mode = ["n" "x"];
      }
      {
        action = "v:count == 0 ? 'gk' : 'k'";
        key = "k";
        options = {
          expr = true;
          silent = true;
        };
        mode = ["n" "x"];
      }
      {
        action = "v:count == 0 ? 'gk' : 'k'";
        key = "<Up>";
        options = {
          expr = true;
          silent = true;
        };
        mode = ["n" "x"];
      }
      {
        action = "<C-w>h";
        key = "<C-h>";
        options = {
          desc = "Go to left window";
          remap = true;
        };
        mode = "n";
      }
      {
        action = "<C-w>j";
        key = "<C-j>";
        options = {
          desc = "Go to lower window";
          remap = true;
        };
        mode = "n";
      }
      {
        action = "<C-w>k";
        key = "<C-k>";
        options = {
          desc = "Go to upper window";
          remap = true;
        };
        mode = "n";
      }
      {
        action = "<C-w>l";
        key = "<C-l>";
        options = {
          desc = "Go to right window";
          remap = true;
        };
        mode = "n";
      }
      {
        action = "<cmd>resize +2<cr>";
        key = "<C-Up>";
        options.desc = "Increase window height";
        mode = "n";
      }
      {
        action = "<cmd>resize -2<cr>";
        key = "<C-Down>";
        options.desc = "Decrease window height";
        mode = "n";
      }
      {
        action = "<cmd>vertical resize -2<cr>";
        key = "<C-Left>";
        options.desc = "Decrease window width";
        mode = "n";
      }
      {
        action = "<cmd>vertical resize +2<cr>";
        key = "<C-Right>";
        options.desc = "Increase window width";
        mode = "n";
      }
      {
        action = "<cmd>m .+1<cr>==";
        key = "<A-j>";
        options.desc = "Move down";
        mode = "n";
      }
      {
        action = "<cmd>m .-2<cr>==";
        key = "<A-k>";
        options.desc = "Move up";
        mode = "n";
      }
      {
        action = "<esc><cmd>m .+1<cr>==gi";
        key = "<A-j>";
        options.desc = "Move down";
        mode = "i";
      }
      {
        action = "<esc><cmd>m .-2<cr>==gi";
        key = "<A-k>";
        options.desc = "Move up";
        mode = "i";
      }
      {
        action = ":m '>+1<cr>gv=gv";
        key = "<A-j>";
        options.desc = "Move down";
        mode = "v";
      }
      {
        action = ":m '<-2<cr>gv=gv";
        key = "<A-k>";
        options.desc = "Move up";
        mode = "v";
      }
      {
        action = "<cmd>bprevious<cr>";
        key = "<S-h>";
        options.desc = "Prev buffer";
        mode = "n";
      }
      {
        action = "<cmd>bnext<cr>";
        key = "<S-l>";
        options.desc = "Next buffer";
        mode = "n";
      }
      {
        action = "<cmd>bprevious<cr>";
        key = "[b";
        options.desc = "Prev buffer";
        mode = "n";
      }
      {
        action = "<cmd>bnext<cr>";
        key = "]b";
        options.desc = "Next buffer";
        mode = "n";
      }
      {
        action = "<cmd>e #<cr>";
        key = "<leader>bb";
        options.desc = "Switch to Other Buffer";
        mode = "n";
      }
      {
        action = "<cmd>e #<cr>";
        key = "<leader>`";
        options.desc = "Switch to Other Buffer";
        mode = "n";
      }
      {
        action = "<cmd>noh<cr><esc>";
        key = "<esc>";
        options.desc = "Escape and clear hlsearch";
        mode = ["i" "n"];
      }
      {
        action = "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>";
        key = "<leader>ur";
        options.desc = "Redraw / clear hlsearch / diff update";
        mode = "n";
      }
      {
        action = "'Nn'[v:searchforward].'zv'";
        key = "n";
        options = {
          expr = true;
          desc = "Next search result";
        };
        mode = "n";
      }
      {
        action = "'Nn'[v:searchforward]";
        key = "n";
        options = {
          expr = true;
          desc = "Next search result";
        };
        mode = "x";
      }
      {
        action = "'Nn'[v:searchforward]";
        key = "n";
        options = {
          expr = true;
          desc = "Next search result";
        };
        mode = "o";
      }
      {
        action = "'nN'[v:searchforward].'zv'";
        key = "N";
        options = {
          expr = true;
          desc = "Prev search result";
        };
        mode = "n";
      }
      {
        action = "'nN'[v:searchforward]";
        key = "N";
        options = {
          expr = true;
          desc = "Prev search result";
        };
        mode = "x";
      }
      {
        action = "'nN'[v:searchforward]";
        key = "N";
        options = {
          expr = true;
          desc = "Prev search result";
        };
        mode = "o";
      }
      {
        action = ",<c-g>u";
        key = ",";
        mode = "i";
      }
      {
        action = ".<c-g>u";
        key = ".";
        mode = "i";
      }
      {
        action = ";<c-g>u";
        key = ";";
        mode = "i";
      }
      {
        action = "<gv";
        key = "<";
        mode = "v";
      }
      {
        action = ">gv";
        key = ">";
        mode = "v";
      }
      {
        action = "<cmd>w<cr><esc>";
        key = "<C-s>";
        options.desc = "Save file";
        mode = ["i" "x" "n" "s"];
      }
      {
        action = "<cmd>norm! K<cr>";
        key = "<leader>K";
        options.desc = "Keywordprg";
        mode = "n";
      }
      {
        action = "<cmd>enew<cr>";
        key = "<leader>fn";
        options.desc = "New File";
        mode = "n";
      }
      {
        action = "<cmd>lopen<cr>";
        key = "<leader>xl";
        options.desc = "Location List";
        mode = "n";
      }
      {
        action = "<cmd>copen<cr>";
        key = "<leader>xq";
        options.desc = "Quickfix List";
        mode = "n";
      }
      {
        action = "vim.cmd.cprev";
        key = "[q";
        lua = true;
        options.desc = "Previous quickfix";
        mode = "n";
      }
      {
        action = "vim.cmd.cnext";
        key = "]q";
        lua = true;
        options.desc = "Next quickfix";
        mode = "n";
      }
      {
        action = "vim.diagnostic.open_float";
        key = "<leader>cd";
        lua = true;
        options.desc = "Line Diagnostics";
        mode = "n";
      }
      {
        action = "diagnostic_goto(true)";
        key = "]d";
        lua = true;
        options.desc = "Next Diagnostic";
        mode = "n";
      }
      {
        action = "diagnostic_goto(false)";
        key = "[d";
        lua = true;
        options.desc = "Prev Diagnostic";
        mode = "n";
      }
      {
        action = "diagnostic_goto(true, \" ERROR \")";
        key = "]e";
        lua = true;
        options.desc = "Next Error";
        mode = "n";
      }
      {
        action = "diagnostic_goto(false, \" ERROR \")";
        key = "[e";
        lua = true;
        options.desc = "Prev Error";
        mode = "n";
      }
      {
        action = "diagnostic_goto(true, \" WARN \")";
        key = "]w";
        lua = true;
        options.desc = "Next Warning";
        mode = "n";
      }
      {
        action = "diagnostic_goto(false, \" WARN \")";
        key = "[w";
        lua = true;
        options.desc = "Prev Warning";
        mode = "n";
      }
      {
        action = "<cmd>qa<cr>";
        key = "<leader>qq";
        options.desc = "Quit all";
        mode = "n";
      }
      {
        action = "vim.show_pos";
        key = "<leader>ui";
        lua = true;
        options.desc = "Inspect Pos";
        mode = "n";
      }
      {
        action = "<c-\\><c-n>";
        key = "<esc><esc>";
        options.desc = "Enter Normal Mode";
        mode = "t";
      }
      {
        action = "<cmd>wincmd h<cr>";
        key = "<C-h>";
        options.desc = "Go to left window";
        mode = "t";
      }
      {
        action = "<cmd>wincmd j<cr>";
        key = "<C-j>";
        options.desc = "Go to lower window";
        mode = "t";
      }
      {
        action = "<cmd>wincmd k<cr>";
        key = "<C-k>";
        options.desc = "Go to upper window";
        mode = "t";
      }
      {
        action = "<cmd>wincmd l<cr>";
        key = "<C-l>";
        options.desc = "Go to right window";
        mode = "t";
      }
      {
        action = "<cmd>close<cr>";
        key = "<C-/>";
        options.desc = "Hide Terminal";
        mode = "t";
      }
      {
        action = "<cmd>close<cr>";
        key = "<c-_>";
        options.desc = "which_key_ignore";
        mode = "t";
      }
      {
        action = "<C-W>p";
        key = "<leader>ww";
        options = {
          desc = "Other window";
          remap = true;
        };
        mode = "n";
      }
      {
        action = "<C-W>c";
        key = "<leader>wd";
        options = {
          desc = "Delete window";
          remap = true;
        };
        mode = "n";
      }
      {
        action = "<C-W>s";
        key = "<leader>w-";
        options = {
          desc = "Split window below";
          remap = true;
        };
        mode = "n";
      }
      {
        action = "<C-W>v";
        key = "<leader>w|";
        options = {
          desc = "Split window right";
          remap = true;
        };
        mode = "n";
      }
      {
        action = "<C-W>s";
        key = "<leader>-";
        options = {
          desc = "Split window below";
          remap = true;
        };
        mode = "n";
      }
      {
        action = "<C-W>v";
        key = "<leader>|";
        options = {
          desc = "Split window right";
          remap = true;
        };
        mode = "n";
      }
      {
        action = "<cmd>tablast<cr>";
        key = "<leader><tab>l";
        options.desc = "Last Tab";
        mode = "n";
      }
      {
        action = "<cmd>tabfirst<cr>";
        key = "<leader><tab>f";
        options.desc = "First Tab";
        mode = "n";
      }
      {
        action = "<cmd>tabnew<cr>";
        key = "<leader><tab><tab>";
        options.desc = "New Tab";
        mode = "n";
      }
      {
        action = "<cmd>tabnext<cr>";
        key = "<leader><tab>]";
        options.desc = "Next Tab";
        mode = "n";
      }
      {
        action = "<cmd>tabclose<cr>";
        key = "<leader><tab>d";
        options.desc = "Close Tab";
        mode = "n";
      }
      {
        action = "<cmd>tabprevious<cr>";
        key = "<leader><tab>[";
        options.desc = "Previous Tab";
        mode = "n";
      }
    ];
    options = {
      autowrite = true;
      clipboard = "unnamedplus";
      completeopt = "menu,menuone,noselect";
      conceallevel = 2;
      confirm = true;
      cursorline = true;
      expandtab = true;
      formatoptions = "jcroqlnt";
      grepformat = "%f:%l:%c:%m";
      grepprg = "rg --vimgrep";
      ignorecase = true;
      inccommand = "nosplit";
      laststatus = 3;
      list = true;
      mouse = "a";
      number = true;
      pumblend = 10;
      pumheight = 10;
      relativenumber = true;
      scrolloff = 4;
      sessionoptions = ["buffers" "curdir" "tabpages" "winsize" "help" "globals" "skiprtp" "folds"];
      shiftround = true;
      shiftwidth = 2;
      showmode = false;
      sidescrolloff = 8;
      signcolumn = "yes";
      smartcase = true;
      smartindent = true;
      spelllang = ["en"];
      splitbelow = true;
      splitkeep = "screen";
      splitright = true;
      tabstop = 2;
      termguicolors = true;
      timeoutlen = 300;
      undofile = true;
      undolevels = 10000;
      updatetime = 200;
      virtualedit = "block";
      wildmode = "longest:full,full";
      winminwidth = 5;
      wrap = true;
      fillchars = {
        foldopen = "";
        foldclose = "";
        fold = " ";
        foldsep = " ";
        diff = "╱";
        eob = " ";
      };

      foldlevel = 99;
      # foldmethod = "indent";
    };
  };
}
