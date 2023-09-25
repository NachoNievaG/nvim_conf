local opts = {
  mode = "n",     -- NORMAL mode
  prefix = "<leader>",
  buffer = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true,  -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true,  -- use `nowait` when creating keymaps
}

local mappings = {
  ["e"] = { "<CMD>Oil<CR>", "Explorer" },
  ["w"] = { "<cmd>w!<CR>", "Save" },
  ["q"] = { "<cmd>q<CR>", "Quit" },
  ["W"] = { "<cmd>wa!<CR>", "Save & quit" },
  ["Q"] = { "<cmd>q!<CR>", "Quit" },
  ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
  ["N"] = { "<cmd>tabnew<cr>", "New Buffer" },
  f = {
    name = "Telescope",
    f = {"<cmd>Telescope find_files <cr>", "Find files"},
    w = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
    h = { "<cmd>Telescope help_tags theme=ivy<cr>", "Find Help" },
    d = { "<cmd>Telescope diagnostics <cr>", "Find Diagnostics" },
    p = { "<cmd>TodoTelescope keywords=TODO,FIX <cr>", "Find Pendings" },
    n = { "<cmd>TodoTelescope keywords=NOTE,INFO <cr>", "Find Annotations" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    s = { "<cmd>Telescope git_status<cr>", "Git Status" },
    S = { "<cmd>Telescope git_stash<cr>", "Git Stash" },
    c = { "<cmd>Telescope git_commits<cr>", "Git Commits" },
    C = { "<cmd>Telescope git_bcommits<cr>", "Git Commits" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
  },
  g = {
    name = "Git",
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    s = { "<cmd>Git<cr>", "Git Status" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {"<cmd>Gvdiffsplit<cr>","Diff"},
    g = {"<cmd>LazyGit<cr>","LazyGit"},
  },
  x = {
    name = "Debugger",
    b = { function() require("dap").toggle_breakpoint() end, "Toggle Breakpoint" },
    B = { function() require("dap").clear_breakpoints() end, "Clear Breakpoints" },
    c = { function() require("dap").continue() end, "Continue" },
    i = { function() require("dap").step_into() end, "Step Into" },
    g = { function()
      require("dap-go").debug_test()
      require("dapui").toggle()
    end, "Debug Go Test" },
    l = { function() require("dapui").float_element "breakpoints" end, "List Breakpoints" },
    o = { function() require("dap").step_over() end, "Step Over" },
    q = { function() require("dap").close() end, "Close Session" },
    Q = { function() require("dap").terminate() end, "Terminate" },
    r = { function() require("dap").repl.toggle() end, "REPL" },
    s = { function() require("dapui").float_element "scopes" end, "Scopes" },
    t = { function() require("dapui").float_element "stacks" end, "Threads" },
    u = { function() require("dapui").toggle() end, "Toggle Debugger UI" },
    w = { function() require("dapui").float_element "watches" end, "Watches" },
    x = { function() require("dap.ui.widgets").hover() end, "Inspect" },
  },
  m = {
    name = "Harpoon",
    a = { function() require("harpoon.mark").add_file() end, "Add File" },
    o = { function() require("harpoon.ui").toggle_quick_menu() end, "Menu" },
  },
  d ={
    name = "dadbod",
    b = { "<cmd>DBUIToggle<cr>", "Toggle" },
  }
}


return {
  "folke/which-key.nvim",
  config = function()
    require('which-key').setup({

    plugins={
      marks = false, -- shows a list of your marks on ' and `
      registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      spelling = {
        enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      },
      presets = {
            operators = false, -- adds help for operators like d, y, ...
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = false, -- default bindings on <c-w>
            nav = false, -- misc bindings to work with windows
            z = false, -- bindings for folds, spelling and others prefixed with z
            g = false, -- bindings for prefixed with g
          },
      },
    })

    require('which-key').register(mappings, opts)
  end
}
