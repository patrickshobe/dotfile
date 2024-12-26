return {{
  "robitx/gp.nvim",
  config = function()
    local conf = {
      -- For customization, refer to Install > Configuration in the Documentation/Readme
      -- prov
      providers = {
        copilot = {
          endpoint = "https://api.githubcopilot.com/chat/completions",
          secret = {
            "bash",
            "-c",
            "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//'",
          },
        },

        ollama = {
          endpoint = "http://localhost:11434/v1/chat/completions",
        },
      },
      agents = {
        {
          name = "ChatGPT4o",
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          provider = "copilot",
          name = "ChatCopilot",
          chat = true,
          command = false,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").chat_system_prompt,
        },
        {
          provider = "copilot",
          name = "CodeCopilot",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = { model = "gpt-4o", temperature = 0.8, top_p = 1, n = 1 },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").code_system_prompt,
        },
        {
          provider = "ollama",
          name = "CodeOllamaLlama3.1-8B",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = {
            model = "llama3.1",
            temperature = 0.4,
            top_p = 1,
            min_p = 0.05,
          },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").code_system_prompt,
        },
        {
          provider = "ollama",
          name = "mistral-nemo",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = {
            model = "mistral-nemo",
            temperature = 0.4,
            top_p = 1,
            min_p = 0.05,
          },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").code_system_prompt,
        },
        {
          provider = "gemma",
          name = "codegemma",
          chat = false,
          command = true,
          -- string with model name or table with model name and parameters
          model = {
            model = "codegemma",
            temperature = 0.4,
            top_p = 1,
            min_p = 0.05,
          },
          -- system prompt (use this to specify the persona/role of the AI)
          system_prompt = require("gp.defaults").code_system_prompt,
        },
      },
    }

    require("gp").setup(conf)
  end,
},
}
