require("neo-tree").setup({
  log_level = "info",
  close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = false,
  sort_case_insensitive = false, -- used when sorting files and directories in the tree
  sort_function = nil , -- use a custom function for sorting files and directories in the tree
  -- sort_function = function (a,b)
  --       if a.type == b.type then
  --           return a.path > b.path
  --       else
  --           return a.type > b.type
  --       end
  --   end , -- this sorts files and directories descendantly
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function ()
        vim.cmd [[setl cc=0]]
      end
    },
  },
  default_component_configs = {
    container = {
      enable_character_fade = true,
      width = "100%",
      right_padding = 0,
    },
    indent = {
      indent_size = 2,
      padding = 1, -- extra padding on left hand side
      -- indent guides
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
      -- expander config, needed for nesting files
      with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "ﰊ",
      -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
      -- then these will never be used.
      default = "*",
      highlight = "NeoTreeFileIcon"
    },
    modified = {
      symbol = "[+]",
      highlight = "NeoTreeModified",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = true,
      highlight = "NeoTreeFileName",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted   = "✖",-- this can only be used in the git_status source
        renamed   = "",-- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "",
        staged    = "",
        conflict  = "",
      }
    },
  },
  window = {
    position = "current",
    width = "100%",
    auto_expand_width = true,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["o"] = "toggle_node",
      ["<2-LeftMouse>"] = "open",
      ["<cr>"] = "open",
      ["<esc>"] = "close_window",
      -- ["P"] = { "toggle_preview", config = { use_float = true } },
      -- ["S"] = "open_split",
      -- ["s"] = "open_vsplit",
      -- ["S"] = "split_with_window_picker",
      -- ["s"] = "vsplit_with_window_picker",
      -- ["t"] = "open_tabnew",
      -- ["<cr>"] = "open_drop",
      -- ["t"] = "open_tab_drop",
      -- ["w"] = "open_with_window_picker",
      --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
      ["C"] = "close_node",
      ["z"] = "close_all_nodes",
      --["Z"] = "expand_all_nodes",
      ["a"] = {
        "add",
        -- some commands may take optional config options, see `:h neo-tree-mappings` for details
        config = {
          show_path = "none" -- "none", "relative", "absolute"
        }
      },
      ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
      ["d"] = "delete",
      ["r"] = "rename",
      ["y"] = "copy_to_clipboard",
      -- ["x"] = "cut_to_clipboard",
      ["p"] = "paste_from_clipboard",
      -- ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
      ["c"] = {
       "copy",
       config = {
         show_path = "relative" -- "none", "relative", "absolute"
       }
      },
      ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
      -- ["q"] = "close_window",
      ["R"] = "refresh",
      ["?"] = "show_help",
      ["<"] = "prev_source",
      [">"] = "next_source",
    }
  },
  nesting_rules = {},
  filesystem = {
    filtered_items = {
      visible = false, -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_hidden = true, -- only works on Windows for hidden files/directories
      hide_by_name = {
        "__pycache__",
        ".coverage",
        ".git",
        "node_modules",
        ".cache",
        ".idea",
        ".venv",
      },
      hide_by_pattern = { -- uses glob style patterns
        --"*.meta",
        --"*/src/*/tsconfig.json",
        "*.pyc",
        "*.o",
        "*.dylib",
        "*.so",
      },
      always_show = { -- remains visible even if other settings would normally hide it
        --".gitignored",
      },
      never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
        ".DS_Store",
        "thumbs.db",
      },
      never_show_by_pattern = { -- uses glob style patterns
        --".null-ls_*",
      },
    },
    follow_current_file = false, -- This will find and focus the file in the active buffer every
                                 -- time the current file is changed while the tree is open.
    group_empty_dirs = false, -- when true, empty folders will be grouped together
    hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
                                            -- in whatever position is specified in window.position
                          -- "open_current",  -- netrw disabled, opening a directory opens within the
                                            -- window like netrw would, regardless of window.position
                          -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
                                    -- instead of relying on nvim autocmd events.
    window = {
      mappings = {
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["H"] = "toggle_hidden",
        ["/"] = "fuzzy_finder",
        ["D"] = "fuzzy_finder_directory",
        ["f"] = "filter_on_submit",
        ["<c-x>"] = "clear_filter",
        ["[g"] = "prev_git_modified",
        ["]g"] = "next_git_modified",
      }
    }
  },
  buffers = {
    follow_current_file = true, -- This will find and focus the file in the active buffer every
                                 -- time the current file is changed while the tree is open.
    group_empty_dirs = true, -- when true, empty folders will be grouped together
    show_unloaded = true,
    window = {
      mappings = {
        ["bd"] = "buffer_delete",
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
      }
    },
  },
  git_status = {
    window = {
      position = "float",
      mappings = {
        ["A"]  = "git_add_all",
        ["gu"] = "git_unstage_file",
        ["ga"] = "git_add_file",
        ["gr"] = "git_revert_file",
        ["gc"] = "git_commit",
        ["gp"] = "git_push",
        ["gg"] = "git_commit_and_push",
      }
    }
  },
})


local palette = vim.fn["my#get_palette"]()

vim.cmd([[hi clear NeoTreeGitUntracked]])
vim.cmd([[hi clear NeoTreeRootName]])
vim.cmd([[hi NeoTreeGitUntracked guifg=]] ..  palette["aqua"][1])
vim.cmd([[hi NeoTreeGitUnstaged guifg=NONE guibg=NONE]])
vim.cmd([[hi NeoTreeGitStaged guifg=NONE guibg=NONE]])
vim.cmd([[hi NeoTreeDirectoryIcon guifg=]] .. palette["orange"][1])
vim.cmd([[hi NeoTreeGitModified guifg=]] .. palette["yellow"][1])
vim.cmd([[hi NeoTreeFloatBorder guifg=]] .. palette["bg2"][1] .. [[ guibg=]] .. palette["bg0"][1])
vim.cmd([[hi NeoTreeFloatTitle guibg=]] .. palette["bg0"][1])
vim.cmd([[hi NeoTreeFloatNormal guibg=]] .. palette["bg0"][1])
vim.cmd([[hi NeoTreeTitleBar guibg=]] .. palette["bg0"][1])
vim.cmd([[hi NeoTreeNormal guibg=]] .. palette["bg0"][1])
vim.cmd([[hi NeoTreeEndOfBuffer guibg=]] .. palette["bg0"][1])
vim.cmd([[hi NeoTreeFilterTerm guibg=]] .. palette["bg0"][1])

-- vim.cmd([[hi FloatBorder guifg=]] .. palette["bg4"][1] .. [[ guibg=]] .. palette["bg0"][1])
-- vim.cmd([[hi NeoTreeGitAdded guifg=NONE guibg=NONE]])
-- vim.cmd([[hi NeoTreeGitConflict guifg=NONE guibg=NONE]])
-- vim.cmd([[hi NeoTreeGitDeleted guifg=NONE guibg=NONE]])
-- vim.cmd([[hi NeoTreeGitIgnored guifg=NONE guibg=NONE]])
-- vim.cmd([[hi NeoTreeGitRenamed guifg=NONE guibg=NONE]])

-- vim.cmd([[ hi clear NeoTreeBufferNumber ]])
-- vim.cmd([[ hi clear NeoTreeCursorLine ]])
-- vim.cmd([[ hi clear NeoTreeDimText ]])
-- vim.cmd([[ hi clear NeoTreeDirectoryIcon ]])
-- vim.cmd([[ hi clear NeoTreeDirectoryName ]])
-- vim.cmd([[ hi clear NeoTreeDotfile ]])
-- vim.cmd([[ hi clear NeoTreeFadeText1 ]])
-- vim.cmd([[ hi clear NeoTreeFadeText2 ]])
-- vim.cmd([[ hi clear NeoTreeFileIcon ]])
-- vim.cmd([[ hi clear NeoTreeFileName ]])
-- vim.cmd([[ hi clear NeoTreeFileNameOpened ]])
-- vim.cmd([[ hi clear NeoTreeFilterTerm ]])
-- vim.cmd([[ hi clear NeoTreeFloatBorder ]])
-- vim.cmd([[ hi clear NeoTreeFloatTitle ]])
-- vim.cmd([[ hi clear NeoTreeGitAdded ]])
-- vim.cmd([[ hi clear NeoTreeGitConflict ]])
-- vim.cmd([[ hi clear NeoTreeGitDeleted ]])
-- vim.cmd([[ hi clear NeoTreeGitIgnored ]])
-- vim.cmd([[ hi clear NeoTreeGitModified ]])
-- vim.cmd([[ hi clear NeoTreeGitRenamed ]])
-- vim.cmd([[ hi clear NeoTreeGitStaged ]])
-- vim.cmd([[ hi clear NeoTreeGitUntracked ]])
-- vim.cmd([[ hi clear NeoTreeGitUnstaged ]])
-- vim.cmd([[ hi clear NeoTreeHiddenByName ]])
-- vim.cmd([[ hi clear NeoTreeIndentMarker ]])
-- vim.cmd([[ hi clear NeoTreeModified ]])
-- vim.cmd([[ hi clear NeoTreeNormal ]])
-- vim.cmd([[ hi clear NeoTreeNormalNC ]])
-- vim.cmd([[ hi clear NeoTreeSignColumn ]])
-- vim.cmd([[ hi clear NeoTreeStatusLine ]])
-- vim.cmd([[ hi clear NeoTreeStatusLineNC ]])
-- vim.cmd([[ hi clear NeoTreeTabActive ]])
-- vim.cmd([[ hi clear NeoTreeTabInactive ]])
-- vim.cmd([[ hi clear NeoTreeTabSeparatorActive ]])
-- vim.cmd([[ hi clear NeoTreeTabSeparatorInactive ]])
-- vim.cmd([[ hi clear NeoTreeVertSplit ]])
-- vim.cmd([[ hi clear NeoTreeWinSeparator ]])
-- vim.cmd([[ hi clear NeoTreeEndOfBuffer ]])
-- vim.cmd([[ hi clear NeoTreeRootName ]])
-- vim.cmd([[ hi clear NeoTreeSymbolicLinkTarget ]])
-- vim.cmd([[ hi clear NeoTreeTitleBar ]])
-- vim.cmd([[ hi clear NeoTreeIndentMarker ]])
-- vim.cmd([[ hi clear NeoTreeExpander ]])
-- vim.cmd([[ hi clear NeoTreeWindowsHidden ]])
-- vim.cmd([[ hi clear NeoTreePreview ]])
