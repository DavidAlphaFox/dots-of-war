fish_vi_key_bindings
# fish_default_key_bindings

# disable truecolor for dvtm
# set -e fish_term24bit
#source /home/leon/.config/fish/gruvbox-colors.fish

#set -U FZF_TMUX 1
set -U FZF_DEFAULT_COMMANDS "--filepath-word --cycle"
set -U FZF_PREVIEW_FILE_CMD "head -n 10 | bat --color=always --decorations=never"
set -U fish_greeting
#function fish_greeting
#end


alias ls="exa --icons"
alias tcolors="env TERM=xterm-256color tcolors"
abbr --add --global vim nvim
abbr --add --global tsh trash
#abbr --add --global clear "clear && ls"
abbr --add --global cxmonad "nvim /home/leon/.xmonad/lib/Config.hs"


#if status is-interactive
#and not set -q TMUX
    #exec tmux
#end

abbr --add --global gaa "git add --all"
abbr --add --global gc "git commit -m "
abbr --add --global gp "git push"
abbr --add --global gs "git status"


[ (hostname) = "garnix" ] && alias rm='echo "rm is disabled. Please use trash instead."; false'

function run_pipr
  set -l commandline (commandline -b)
  pipr --out-file /tmp/pipr_out --default "$commandline"
  set -l result (cat /tmp/pipr_out)
  commandline -r $result
  commandline -f repaint
end

bind \ca run_pipr

function c
  set -l result (/home/leon/scripts/conf)
  commandline -r "$result"
  commandline -f execute
end




function replace_with_yay
  set -l cmd (commandline -b)
  switch $cmd
  case "*pacman*"
    set edited (echo $cmd | sed 's/sudo //g' | sed 's/pacman/yay/g')
  case "yay*"
    set edited (echo $cmd | sed 's/yay/sudo pacman/g')
  end
  commandline -r "$edited"
  commandline -f repaint
end

bind \cy replace_with_yay

# fff file manager cd on exit
function f
    fff $argv
    set -q XDG_CACHE_HOME; or set XDG_CACHE_HOME $HOME/.cache
    cd (cat $XDG_CACHE_HOME/fff/.fff_d)
end
set -x EDITOR "nvim"
set -x FFF_TRASH_CMD "trash" # make fff's trash function use trash-cli

fenv source '$HOME/.nix-profile/etc/profile.d/nix.sh'
#bass source '$HOME/.nix-profile/etc/profile.d/nix.sh' &
set -g NIX_PATH "$HOME/.nix-defexpr/channels:$NIX_PATH"
fenv source "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
#eval (direnv hook fish)

