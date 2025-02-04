(module dots.plugins.trouble
  {autoload {utils dots.utils
             colors dots.colors}
   require {trouble trouble}})

(trouble.setup
 {:icons false
  :auto_preview true
  :auto_close true
  :auto_open false
  :auto_jump ["lsp_definitions" "lsp_workspace_diagnostics" "lsp_type_definitions"]
  :indent_lines false
  :action_keys
    {:jump "o"
     :jump_close "<CR>"
     :close "<esc>"
     :cancel "q"
     :hover ["a" "K"]}})

(utils.highlight "TroubleFoldIcon" {:bg "NONE" :fg colors.bright_orange})
(utils.highlight "TroubleCount"    {:bg "NONE" :fg colors.bright_green})
(utils.highlight "TroubleText"     {:bg "NONE" :fg colors.light0})

(utils.highlight "TroubleSignError"       {:bg "NONE" :fg colors.bright_red})
(utils.highlight "TroubleSignWarning"     {:bg "NONE" :fg colors.bright_yellow})
(utils.highlight "TroubleSignInformation" {:bg "NONE" :fg colors.bright_aqua})
(utils.highlight "TroubleSignHint"        {:bg "NONE" :fg colors.bright_blue})
