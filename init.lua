local config = {

  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "main", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    -- remotes = { -- easily add new remotes to track
    --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
    --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
    --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    -- },
  },

  -- Set colorscheme
  colorscheme = "catppuccin",

  -- set vim options here (vim.<first_key>.<second_key> =  value)
  options = {
    opt = {
      relativenumber = true, -- sets vim.opt.relativenumber
    },
    g = {
      mapleader = " ", -- sets vim.g.mapleader
      catppuccin_flavour = "mocha",
    },
  },

  -- Default theme configuration
  -- default_theme = {
  --   diagnostics_style = { italic = true },
  --   -- Modify the color table
  --   colors = {
  --     fg = "#abb2bf",
  --   },
  --   -- Modify the highlight groups
  --   highlights = function(highlights)
  --     local C = require "default_theme.colors"
  --
  --     highlights.Normal = { fg = C.fg, bg = C.bg }
  --     return highlights
  --   end,
  --   plugins = { -- enable or disable extra plugin highlighting
  --     aerial = true,
  --     beacon = false,
  --     bufferline = true,
  --     dashboard = true,
  --     highlighturl = true,
  --     hop = false,
  --     indent_blankline = true,
  --     lightspeed = false,
  --     ["neo-tree"] = true,
  --     notify = true,
  --     ["nvim-tree"] = true,
  --     ["nvim-web-devicons"] = true,
  --     rainbow = true,
  --     symbols_outline = false,
  --     telescope = true,
  --     vimwiki = false,
  --     ["which-key"] = true,
  --   },
  -- },

  -- Disable AstroNvim ui features
  ui = {
    nui_input = true,
    telescope_select = true,
  },

  -- Configure plugins
  plugins = {
    -- Add plugins, the packer syntax without the "use"
    init = {
      ["ahmedkhalf/project.nvim"] = {},
      ["catppuccin/nvim"] = {}, -- catppuccin theme
      ["rafamadriz/neon"] = {}, -- Neon theme
      ["edluffy/hologram.nvim"] = {},
      ["akinsho/toggleterm.nvim"] = { disable = true },
      ["kdheepak/lazygit.nvim"] = {},
      -- ["mfussenegger/nvim-dap"] = {},
      -- ["rcarriga/nvim-dap-ui"] = {},
      ["nvim-telescope/telescope-dap.nvim"] = {},
      ["sindrets/diffview.nvim"] = {},
      ["nvim-treesitter/nvim-treesitter-textobjects"] = {},
      -- You can disable default plugins as follows:
      -- ["goolord/alpha-nvim"] = { disable = true },

      -- You can also add new plugins here as well:
      -- { "andweeb/presence.nvim" },
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
    },
    aerial = {
      min_width = { 60, 0.25 },
      on_attach = function() end,
    },
    bufferline = {
      options = {
        max_name_length = 44,
        max_prefix_length = 43,
      }
    },
    ["neo-tree"] = {
      window = {
        width = "25%",
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        }
      }
    },

    ["mfussenegger/nvim-dap"] = {
      config = require "user.plugins.dap.config"
    },
    ["rcarriga/nvim-dap-ui"] = {
      config = require "user.plugins.dap-ui.config"
    },
    telescope = {
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = 'respect_case', -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      },
      defaults = {
        prompt_prefix = "   ",
        layout_strategy = "vertical",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            prompt_position = "top",
            mirror = true,
            preview_height = 0.35,
            preview_cutoff = 1,
          },
          width = 0.80,
          height = 0.80,
          preview_cutoff = 120,
        },
      }
    },
    -- All other entries override the setup() call for default plugins
    ["null-ls"] = function(config)
      local null_ls = require "null-ls"
      -- Check supported formatters and linters
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
      -- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
      config.sources = {
        -- Set a formatter
        null_ls.builtins.formatting.prettier,
        -- null_ls.builtins.formatting.rufo,
        -- Set a linter
        -- null_ls.builtins.diagnostics.eslint,
        -- null_ls.builtins.diagnostics.rubocop,
      }
      return config -- return final config table
    end,
    treesitter = {
      ensure_installed = { "lua" },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]m"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[m"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
        select = {
          enable = true,

          -- automatically jump forward to textobj, similar to targets.vim
          lookahead = true,

          keymaps = {
            -- you can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            -- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
          },
          -- you can choose the select mode (default is charwise 'v')
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'V', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- if you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding xor succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          include_surrounding_whitespace = true,
        },
      }
    },
    ["nvim-lsp-installer"] = {
      ensure_installed = { "sumneko_lua" },
    },
    packer = {
      compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
    },
  },
  ["sumneko_lua"] = {
    on_attach = function() end,
  },

  -- Luasnip options
  luasnip = {
    -- add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- Modify which-key registration
  ["which-key"] = {
    -- add bindings
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- which-key registration table for normal mode, leader prefix
          -- ["n"] = { "<cmd>tabnew<cr>", "New Buffer" },
        },
      },
    },
  },

  -- Cmp source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 1000,
      luasnip = 750,
      buffer = 500,
      path = 250,
    },
  },

  -- Diagnostics configuration (for vim.diagnostics.config({}))
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  -- Extend LSP configuration
  lsp = {
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    formatting = {
      format_on_save = true, -- enable or disable auto formatting on save
      disabled = { -- disable formatting capabilities for the listed clients
        -- "sumneko_lua",
      },
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr)
    -- end,

    -- override the mason server-registration function
    -- server_registration = function(server, opts)
    --   require("lspconfig")[server].setup(opts)
    -- end,

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
    },
  },

  -- This function is run last
  -- good place to configure mappings and vim options
  polish = function()
    -- Set key bindings
    vim.keymap.set("n", "<C-s>", ":w!<CR>")

    -- Set autocommands
    vim.api.nvim_create_augroup("packer_conf", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
      desc = "Sync packer after modifying plugins.lua",
      group = "packer_conf",
      pattern = "plugins.lua",
      command = "source <afile> | PackerSync",
    })

    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}

return config
