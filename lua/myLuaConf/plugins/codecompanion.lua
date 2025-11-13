return {
  {
    "codecompanion.nvim",
    for_cat = "general.extra",
    event = "DeferredUIEnter",
    after = function (_)
      require("codecompanion").setup({
        adapters = {
          http = {
            qwen3 = function ()
              return require("codecompanion.adapters").extend("ollama", {
                name = "qwen3",
                env = {
                  url = "http://192.168.21.98:8080",
                  api_key = "LLAMA_API_KEY",
                },
                headers = {
                  ["Content-Type"] = "application/json",
                  ["Authorization"] = "Bearer ${api_key}",
                },
                parameters = {
                  sync = true,
                },
              })
            end,
          },
        },
        opts = {
          log_level = "DEBUG",
        },
        strategies = {
          chat = {
            adapter = "qwen3",
          },
        },
      })
    end,
  },
}
