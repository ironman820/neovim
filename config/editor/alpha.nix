{
  extraConfigLuaPre = ''
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣦⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⡿⠿⠛⠋⢉⣀⣀⣤⣤⣤⣤⣤⣤⣤⣤⣀⣈⡉⠙⠛⠿⢿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⠟⠋⢁⣠⣴⣶⣿⣿⣿⣿⠛⠉⠉⠉⠉⠉⠉⠛⣿⣿⣿⣿⣶⣦⣄⡈⠙⠻⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⠟⠋⣀⣴⣾⠿⠛⠉⢹⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡏⠉⠛⢿⣷⣦⡀⠙⠿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⠟⢁⣠⣾⡿⠋⠁⠀⠀⠀⠘⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⠁⠀⠀⠀⠈⠙⢿⣷⣄⠈⠻⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⣴⣿⣿⣿⠟⠁⣰⣾⠟⠁⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠉⠻⣷⣄⠈⢻⣿⣿⣿⣦⠀⠀⠀⠀⠀",
      "⠀⠀⠀⢀⣾⣿⣿⣿⠋⢠⣾⣿⣁⣀⣀⣀⣀⣀⣀⣀⣀⣀⣸⣿⣿⣿⣇⣀⣀⣀⣀⣀⣀⣾⣿⣿⣿⣇⣀⣀⣀⣀⣀⣀⣀⣀⣀⣘⣿⣷⡀⠙⣿⣿⣿⣷⡀⠀⠀⠀",
      "⠀⠀⢀⣾⣿⣿⡿⠁⣰⣿⣿⣿⣿⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠻⣿⣿⣿⣿⣄⠘⢿⣿⣿⣷⡀⠀⠀",
      "⠀⠀⣾⣿⣿⡿⠁⣰⣿⣿⣿⣿⣿⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣿⣿⣿⣿⣿⣆⠘⣿⣿⣿⣧⠀⠀",
      "⠀⣸⣿⣿⣿⠃⢰⣿⣿⣿⡋⠉⠙⠻⢿⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⡿⠟⠉⠉⢹⣿⣿⣿⡄⠘⣿⣿⣿⣇⠀",
      "⢀⣿⣿⣿⡏⢀⣿⡏⠀⠹⣷⡀⠀⠀⠀⠉⠛⠿⣷⣦⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣠⣴⣾⠿⠛⠁⠀⠀⠀⢀⣾⠏⠀⢻⣷⠀⢻⣿⣿⣿⡀",
      "⢸⣿⣿⣿⠁⢸⣿⠁⠀⠀⠙⣷⡄⠀⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠁⠀⠀⠀⠀⠀⢠⣿⠃⠀⠀⠈⣿⡇⠈⣿⣿⣿⡇",
      "⣿⣿⣿⣿⠀⣿⡟⠀⠀⠀⠀⠘⢿⡄⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⠛⠙⢿⣿⣿⣿⣿⡿⠋⠻⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⣠⡿⠃⠀⠀⠀⠀⣿⣷⠀⣿⣿⣿⣧",
      "⣿⣿⣿⡇⠀⣿⡇⠀⠀⠀⠀⠀⠈⢿⣆⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣦⣤⡀⠀⠀⠀⠀⢀⣤⣴⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⣰⡿⠁⠀⠀⠀⠀⠀⢸⣿⠀⢿⣿⣿⣿",
      "⣿⣿⣿⡇⠀⣿⡇⠀⠀⠀⠀⣀⣤⣼⣿⣆⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣷⡀⠀⠀⢠⣾⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⣼⣿⣦⣄⣀⠀⠀⠀⠀⢸⣿⠀⣿⣿⣿⣿",
      "⢿⣿⣿⣿⠀⣿⣧⣤⣶⣾⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⡄⢠⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣷⣶⣤⣿⡿⠀⣿⣿⣿⡟",
      "⢸⣿⣿⣿⡀⢸⣿⣿⣿⣿⣿⣿⠿⠛⠋⠀⠹⣧⡀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣄⣠⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⢀⣾⠏⠈⠙⠻⠿⣿⣿⣿⣿⣿⣿⡇⢠⣿⣿⣿⡇",
      "⠈⣿⣿⣿⣇⠈⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠹⣷⡀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⢠⣾⠋⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⡿⠀⣼⣿⣿⣿⠀",
      "⠀⢹⣿⣿⣿⡄⠸⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⡄⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⢠⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⠃⢰⣿⣿⣿⠇⠀",
      "⠀⠀⢿⣿⣿⣷⡀⠹⣿⣄⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣄⠀⠀⠀⠀⠀⠀⠈⣿⣿⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⣰⣿⠏⢠⣿⣿⣿⡟⠀⠀",
      "⠀⠀⠈⢿⣿⣿⣷⡄⠹⣿⣦⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⢿⣆⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⣴⡿⣿⣿⣿⣿⣿⣶⣄⡀⠀⠀⣴⣿⠃⢠⣿⣿⣿⡟⠁⠀⠀",
      "⠀⠀⠀⠈⢿⣿⣿⣿⣄⠈⢿⣷⣶⣿⣿⣿⣿⣿⡿⠛⠁⠀⢻⣦⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⣼⡟⠀⠈⠻⢿⣿⣿⣿⣿⣿⣶⣾⡟⠁⣰⣿⣿⣿⡟⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠻⣿⣿⣿⣧⡀⠙⢿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠻⣧⠀⠀⠀⠀⣿⣿⠀⠀⠀⢀⣾⠏⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⡿⠋⢀⣾⣿⣿⣿⠏⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣦⡀⠙⢿⣿⣤⡀⠀⠀⠀⠀⠀⠀⠹⣷⡀⠀⠀⣿⣿⠀⠀⢀⣾⠏⠀⠀⠀⠀⠀⠀⢀⣤⣿⠿⠋⣀⣴⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣷⣄⡈⠛⢿⣷⣦⣄⡀⠀⠀⠀⠙⣷⣦⣶⣿⣿⣶⣴⣿⠃⠀⠀⠀⢀⣠⣴⣾⠿⠛⢁⣠⣾⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣶⣤⣈⠙⠛⠿⢿⣶⣶⣤⣾⣿⣿⣿⣿⣿⣿⣧⣤⣶⣶⡿⠿⠛⠋⣀⣤⣶⣿⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣦⣤⣀⣉⠉⠙⠛⠛⠛⠛⠛⠛⠉⠉⣉⣀⣤⣴⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⠿⠿⠿⢿⣿⣿⣿⣿⡿⠿⠿⠿⠛⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    }

    dashboard.section.buttons.val = {
      dashboard.button("e", "󰈔 New file", "<cmd>ene <BAR> startinsert<CR>"),
      dashboard.button("SPC SPC", "󰱼 Find file"),
      dashboard.button("SPC /", " Find word"),
      dashboard.button("SPC f r", " Recent files"),
      dashboard.button("SPC q s", "󰑌 Open session for this folder"),
      dashboard.button("SPC q l", "󱎝 Open last session"),
      dashboard.button("q", " Quit", "<cmd>qa<cr>"),
    }
  '';
  plugins.alpha = {
    enable = true;
    theme = {
      __raw = "dashboard.config";
    };
    # layout = [
    #   {
    #     opts = {
    #       hl = "Type";
    #       position = "center";
    #     };
    #     type = "text";
    #     val = [
    #       "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣦⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    #       "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    #       "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⡿⠿⠛⠋⢉⣀⣀⣤⣤⣤⣤⣤⣤⣤⣤⣀⣈⡉⠙⠛⠿⢿⣿⣿⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    #       "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⠟⠋⢁⣠⣴⣶⣿⣿⣿⣿⠛⠉⠉⠉⠉⠉⠉⠛⣿⣿⣿⣿⣶⣦⣄⡈⠙⠻⣿⣿⣿⣿⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    #       "⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⠟⠋⣀⣴⣾⠿⠛⠉⢹⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⡏⠉⠛⢿⣷⣦⡀⠙⠿⣿⣿⣿⣷⣄⠀⠀⠀⠀⠀⠀⠀⠀"
    #       "⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⣿⠟⢁⣠⣾⡿⠋⠁⠀⠀⠀⠘⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⠁⠀⠀⠀⠈⠙⢿⣷⣄⠈⠻⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀"
    #       "⠀⠀⠀⠀⠀⣴⣿⣿⣿⠟⠁⣰⣾⠟⠁⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠉⠻⣷⣄⠈⢻⣿⣿⣿⣦⠀⠀⠀⠀⠀"
    #       "⠀⠀⠀⢀⣾⣿⣿⣿⠋⢠⣾⣿⣁⣀⣀⣀⣀⣀⣀⣀⣀⣀⣸⣿⣿⣿⣇⣀⣀⣀⣀⣀⣀⣾⣿⣿⣿⣇⣀⣀⣀⣀⣀⣀⣀⣀⣀⣘⣿⣷⡀⠙⣿⣿⣿⣷⡀⠀⠀⠀"
    #       "⠀⠀⢀⣾⣿⣿⡿⠁⣰⣿⣿⣿⣿⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠻⣿⣿⣿⣿⣄⠘⢿⣿⣿⣷⡀⠀⠀"
    #       "⠀⠀⣾⣿⣿⡿⠁⣰⣿⣿⣿⣿⣿⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣿⣿⣿⣿⣿⣆⠘⣿⣿⣿⣧⠀⠀"
    #       "⠀⣸⣿⣿⣿⠃⢰⣿⣿⣿⡋⠉⠙⠻⢿⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣾⡿⠟⠉⠉⢹⣿⣿⣿⡄⠘⣿⣿⣿⣇⠀"
    #       "⢀⣿⣿⣿⡏⢀⣿⡏⠀⠹⣷⡀⠀⠀⠀⠉⠛⠿⣷⣦⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣀⣠⣴⣾⠿⠛⠁⠀⠀⠀⢀⣾⠏⠀⢻⣷⠀⢻⣿⣿⣿⡀"
    #       "⢸⣿⣿⣿⠁⢸⣿⠁⠀⠀⠙⣷⡄⠀⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠁⠀⠀⠀⠀⠀⢠⣿⠃⠀⠀⠈⣿⡇⠈⣿⣿⣿⡇"
    #       "⣿⣿⣿⣿⠀⣿⡟⠀⠀⠀⠀⠘⢿⡄⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⣿⠛⠙⢿⣿⣿⣿⣿⡿⠋⠻⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⣠⡿⠃⠀⠀⠀⠀⣿⣷⠀⣿⣿⣿⣧"
    #       "⣿⣿⣿⡇⠀⣿⡇⠀⠀⠀⠀⠀⠈⢿⣆⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣦⣤⡀⠀⠀⠀⠀⢀⣤⣴⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⣰⡿⠁⠀⠀⠀⠀⠀⢸⣿⠀⢿⣿⣿⣿"
    #       "⣿⣿⣿⡇⠀⣿⡇⠀⠀⠀⠀⣀⣤⣼⣿⣆⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣷⡀⠀⠀⢠⣾⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⣼⣿⣦⣄⣀⠀⠀⠀⠀⢸⣿⠀⣿⣿⣿⣿"
    #       "⢿⣿⣿⣿⠀⣿⣧⣤⣶⣾⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⡄⢠⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣷⣶⣤⣿⡿⠀⣿⣿⣿⡟"
    #       "⢸⣿⣿⣿⡀⢸⣿⣿⣿⣿⣿⣿⠿⠛⠋⠀⠹⣧⡀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣄⣠⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⢀⣾⠏⠈⠙⠻⠿⣿⣿⣿⣿⣿⣿⡇⢠⣿⣿⣿⡇"
    #       "⠈⣿⣿⣿⣇⠈⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠹⣷⡀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⢠⣾⠋⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⡿⠀⣼⣿⣿⣿⠀"
    #       "⠀⢹⣿⣿⣿⡄⠸⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⡄⠀⠀⠀⠀⠀⠀⠈⢿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀⢠⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⠃⢰⣿⣿⣿⠇⠀"
    #       "⠀⠀⢿⣿⣿⣷⡀⠹⣿⣄⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣄⠀⠀⠀⠀⠀⠀⠈⣿⣿⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣷⣤⡀⠀⠀⠀⠀⠀⠀⣰⣿⠏⢠⣿⣿⣿⡟⠀⠀"
    #       "⠀⠀⠈⢿⣿⣿⣷⡄⠹⣿⣦⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⢿⣆⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⣴⡿⣿⣿⣿⣿⣿⣶⣄⡀⠀⠀⣴⣿⠃⢠⣿⣿⣿⡟⠁⠀⠀"
    #       "⠀⠀⠀⠈⢿⣿⣿⣿⣄⠈⢿⣷⣶⣿⣿⣿⣿⣿⡿⠛⠁⠀⢻⣦⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⣼⡟⠀⠈⠻⢿⣿⣿⣿⣿⣿⣶⣾⡟⠁⣰⣿⣿⣿⡟⠀⠀⠀⠀"
    #       "⠀⠀⠀⠀⠀⠻⣿⣿⣿⣧⡀⠙⢿⣿⣿⣿⠿⠋⠀⠀⠀⠀⠀⠻⣧⠀⠀⠀⠀⣿⣿⠀⠀⠀⢀⣾⠏⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⡿⠋⢀⣾⣿⣿⣿⠏⠀⠀⠀⠀⠀"
    #       "⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣦⡀⠙⢿⣿⣤⡀⠀⠀⠀⠀⠀⠀⠹⣷⡀⠀⠀⣿⣿⠀⠀⢀⣾⠏⠀⠀⠀⠀⠀⠀⢀⣤⣿⠿⠋⣀⣴⣿⣿⣿⡿⠁⠀⠀⠀⠀⠀⠀"
    #       "⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣷⣄⡈⠛⢿⣷⣦⣄⡀⠀⠀⠀⠙⣷⣦⣶⣿⣿⣶⣴⣿⠃⠀⠀⠀⢀⣠⣴⣾⠿⠛⢁⣠⣾⣿⣿⣿⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀"
    #       "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⣿⣿⣿⣿⣶⣤⣈⠙⠛⠿⢿⣶⣶⣤⣾⣿⣿⣿⣿⣿⣿⣧⣤⣶⣶⡿⠿⠛⠋⣀⣤⣶⣿⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    #       "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣦⣤⣀⣉⠉⠙⠛⠛⠛⠛⠛⠛⠉⠉⣉⣀⣤⣴⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    #       "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    #       "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠛⠿⠿⠿⢿⣿⣿⣿⣿⡿⠿⠿⠿⠛⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
    #     ];
    #   }
    #   {
    #     type = "group";
    #     val = [
    #       {
    #         on_press = "<cmd>ene <BAR> startinsert<CR>";
    #         opts.shortcut = "e";
    #         type = "button";
    #         val = "󰈔 New file";
    #       }
    #       {
    #         opts.shortcut = "SPC SPC";
    #         type = "button";
    #         val = "󰱼 Find file";
    #       }
    #       {
    #         opts.shortcut = "SPC /";
    #         type = "button";
    #         val = " Find word";
    #       }
    #       {
    #         opts.shortcut = "SPC f r";
    #         type = "button";
    #         val = " Recent files";
    #       }
    #       {
    #         opts.shortcut = "SPC q s";
    #         type = "button";
    #         val = "󰑌 Open session for this folder";
    #       }
    #       {
    #         opts.shortcut = "SPC q l";
    #         type = "button";
    #         val = "󱎝 Open last session";
    #       }
    #       {
    #         on_press = "<cmd>qa<cr>";
    #         opts.shortcut = "q";
    #         type = "button";
    #         val = " Quit";
    #       }
    #     ];
    #   }
    # ];
  };
}
