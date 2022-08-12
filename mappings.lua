local _, sm_sp = pcall(require, "smart-splits")
return {
  n = {
    -- disable default bindings
    ["<C-Down>"] = false,
    ["<C-Left>"] = false,
    ["<C-Right>"] = false,
    ["<C-Up>"] = false,
    ["<C-q>"] = false,
    ["<C-s>"] = false,
    ["<C-\\>"] = false,
    -- return default to default
    Y = {"Y"},
    -- ["{"] = { "{" },
    -- ["}"] = { "}" },
    -- ["[["] = { "]]" },
    -- ["]]"] = { "]]" },
    -- resize with arrows

    ["<C-i>"] = { function() sm_sp.resize_up(2) end, desc = "Resize split up" },
    ["<C-j>"] = { function() sm_sp.resize_down(2) end, desc = "Resize split down" },
    ["<C-h>"] = { function() sm_sp.resize_left(4) end, desc = "Resize split left" },
    ["<C-l>"] = { function() sm_sp.resize_right(4) end, desc = "Resize split right" },
    -- Standard operations
    U = {":redo<cr>", desc = "Redo"},
    [";;"] = {'<Esc>A;<Esc>'},
    [",,"] = {'<Esc>A,<Esc>'},
    ["<leader>u"] = {"<cmd>nohlsearch<cr>", desc = "No Highlight"},

    -- window navigation
    ["<leader>h"] = { function() sm_sp.move_cursor_left() end, desc = "Move to window on the left" },
    ["<leader>j"] = { function() sm_sp.move_cursor_down() end, desc = "Move to below window" },
    ["<leader>k"] = { function() sm_sp.move_cursor_up() end, desc = "Move to above window" },
    ["<leader>l"] = { function() sm_sp.move_cursor_right() end, desc = "Move to window on the right" },
    ["<c-w>"] = {"<cmd>close<cr>", desc = "close window"},
    -- telescope extra search commands
    ["<leader>bf"]= { function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Fuzzy search current file" },
    ["<leader>ss"] = { function() require("telescope.builtin").grep_string() end, desc = "Search word under cursor" },
    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate down" },
    -- easy splits
    ["<leader>|"] = { "<cmd>split<cr>", desc = "Horizontal split" },
    ["|"] = { "<cmd>vsplit<cr>", desc = "Vertical split" },
    -- better increment/decrement
    ["-"] = { "<c-x>", desc = "Descrement number" },
    ["+"] = { "<c-a>", desc = "Increment number" },
    -- Treesitter Surfer
    ["<c-down>"] = { "<cmd>STSSwapDownNormal<cr>", desc = "Swap next tree-sitter object" },
    ["<c-right>"] = { "<cmd>STSSwapDownNormal<cr>", desc = "Swap next tree-sitter object" },
    ["<c-up>"] = { "<cmd>STSSwapUpNormal<cr>", desc = "Swap previous tree-sitter object" },
    ["<c-left>"] = { "<cmd>STSSwapUpNormal<cr>", desc = "Swap previous tree-sitter object" },
  },
  i = {
    -- type template string
    ["<S-Tab>"] = { "<C-V><Tab>", desc = "Tab character" },
  },
  v = {
    -- navigating wrapped lines
    j = { "gj", desc = "Navigate down" },
    k = { "gk", desc = "Navigate down" },
  },
  -- terminal mappings
  t = {
    ["<esc>"] = false,
    ["jk"] = false,
    ["<c-q>"] = { "<c-\\><c-n>", desc = "Terminal normal mode" },
    ["<esc><esc>"] = { "<c-\\><c-n>:q<cr>", desc = "Terminal quit" },
  },
  x = {
    -- better increment/decrement
    ["+"] = { "g<c-a>", desc = "Increment number" },
    ["-"] = { "g<c-x>", desc = "Descrement number" },
    -- line text-objects
    ["il"] = { "g_o^", desc = "Inside line text object" },
    ["al"] = { "$o^", desc = "Around line text object" },
    -- Tressitter Surfer
    ["J"] = { "<cmd>STSSelectNextSiblingNode<cr>", desc = "Surf next tree-sitter object" },
    ["K"] = { "<cmd>STSSelectPrevSiblingNode<cr>", desc = "Surf previous tree-sitter object" },
    ["H"] = { "<cmd>STSSelectParentNode<cr>", desc = "Surf parent tree-sitter object" },
    ["L"] = { "<cmd>STSSelectChildNode<cr>", desc = "Surf child tree-sitter object" },
    ["<c-j>"] = { "<cmd>STSSwapNextVisual<cr>", desc = "Surf next tree-sitter object" },
    ["<c-l>"] = { "<cmd>STSSwapNextVisual<cr>", desc = "Surf next tree-sitter object" },
    ["<c-k>"] = { "<cmd>STSSwapPrevVisual<cr>", desc = "Surf previous tree-sitter object" },
    ["<c-h>"] = { "<cmd>STSSwapPrevVisual<cr>", desc = "Surf previous tree-sitter object" },
  },
  o = {
    -- line text-objects
    ["il"] = { ":normal vil<cr>", desc = "Inside line text object" },
    ["al"] = { ":normal val<cr>", desc = "Around line text object" },
  },
  [""] = {
    ["<c-e><c-e>"] = { "<Plug>SendLine", desc = "Send line to REPL" },
    ["<c-e>"] = { "<Plug>Send", desc = "Send to REPL" },
  },
}
