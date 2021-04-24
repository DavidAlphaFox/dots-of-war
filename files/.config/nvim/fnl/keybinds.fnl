(module keybinds
  {require {a aniseed.core
            nvim aniseed.nvim
            utils utils
            fennel aniseed.fennel}
   require-macros [macros]})


(utils.keymap :n :<leader> ":<c-u>WhichKey '<Space>'<CR>")
(utils.keymap :v :<leader> ":<c-u>WhichKeyVisual '<Space>'<CR>")

(utils.keymap :i :<C-Space> "compe#complete()" {:expr true})
(utils.keymap :i :<esc> "compe#close('<esc>')" {:expr true})



(fn le [s] (.. ":call luaeval(\"" s "\")"))

(set nvim.g.which_key_map {})
(nvim.command "call which_key#register('<Space>', \"g:which_key_map\")")

(set nvim.g.which_key_map
  { "h" [ ":bprevious" "previous buffer"]
    "l" [ ":bnext" "next buffer"]
    "f" "which_key_ignore"
    "s" "which_key_ignore"
    "o" [":Telescope live_grep"              "Grep files"]
    "p" [":Telescope file_browser"           "Open file-browser"]
    "[" ["<Plug>(YoinkPostPasteSwapBack)"    "Swap last paste backwards"]
    "]" ["<Plug>(YoinkPostPasteSwapForward)" "Swap last paste backwards"]
    ":" [":Commands"                         "Search command with fzf"]
    "c" { :name "+comment_out"}
    "e" { :name "+emmet"}

    "z" { :name "+folds" 
          "c" ["foldclose" "close fold"]
          "o" ["foldopen" "open fold"]}
             
    "m" { :name "+Code-actions"
          "d" [ ":Lspsaga hover_doc"                       "show documentation"] 
          "b" [ ":Lspsaga lsp_finder"                      "find stuff"] 
          "x" [ ":Lspsaga preview_definition"              "Preview definition"] 
          "o" [ ":SymbolsOutline"                          "Outline"] 
          "S" [ ":Telescope lsp_document_symbols"          "symbols in document"] 
          "s" [ ":Telescope lsp_dynamic_workspace_symbols" "symbols in workspace"] 
          "t" [ ":Lspsaga signature_help"                  "Show signature help"] 
          "n" [ ":Lspsaga rename"                          "rename"] 
          "v" [ ":Lspsaga code_action"                     "apply codeaction"] 
          "a" [ ":Lspsaga show_cursor_diagnostics"         "Cursor diagnostics"] 
          "A" [ ":Lspsaga show_line_diagnostics"           "Line diagnostics"]
          "E" [ ":Telescope lsp_workspace_diagnostics"     "List diagnostics"] 
          "e" [ (le "vim.lsp.diagnostic.goto_next()")      "Jump to the next error"] 
          "g" [ (le "vim.lsp.buf.definition()")            "go to definition"] 
          "i" [ (le "vim.lsp.buf.implementation()")        "show implementation"] 
          "r" [ ":Telescope lsp_references"                "show references"] 
          "f" [ (le "vim.lsp.buf.formatting()")            "format file"]}
          

    "f" { :name "+folds"
          "o" [ ":foldopen"   "open fold"] 
          "n" [ ":foldclose"  "close fold"] 
          "j" [ "zj"          "jump to next fold"] 
          "k" [ "zk"          "jump to previous fold"]}
  
    "v" { :name "+view-and-layout"
          "n" [":set relativenumber!"             "toggle relative numbers"] 
          "m" [":set nonumber! norelativenumber"  "toggle numbers"] 
          "g" [":Goyo | set linebreak"            "toggle focus mode"] 
          "i" [":IndentGuidesToggle"              "toggle indent guides"]}

    "b" { :name "+buffers"
          "b" [":Buffers"   "select open buffer"]
          "c" [":bdelete!"  "close open buffer"]
          "w" [":bwipeout!" "wipeout open buffer"]}})

(set nvim.o.timeoutlen 200)

(nvim.command
  "autocmd! VimEnter * :unmap <space>ig
   autocmd! FileType which_key")
