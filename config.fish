# Greeting Message
function fish_greeting
end

# Common environment variables.
set -x EDITOR nvim
set -x GIT_EDITOR nvim
set -x PAGER less
set -x TERMINUS_XFONTSEL "-*-terminus-medium-r-*-*-12-*-*-*-*-*-*-*"

# Command line execution path.
set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.bin $PATH
set -x PATH (npm config --global get prefix)/bin $PATH

# Abbreviations
if status --is-interactive
  abbr --add g git
  abbr --add dc docker-compose
  abbr --add dcl docker-compose logs
  abbr --add n npm
  abbr --add y yarn
  abbr --add ta tmux attach -t
end

# Functions
function c
  cd $argv
  l
end

function cl
  clear
  tmux clear-history
  clear
end

function l
  ls -AFhHlX --color=auto --group-directories-first $argv
end

function ll
  ls -FhHlX --color=auto --group-directories-first $argv
end

# Use vim keybindings.
fish_vi_key_bindings

function fish_user_key_bindings
  bind --user -M insert \cp up-or-search
  bind --user -M insert \cn down-or-search
end

# Log everything
set -g fish_debug "*"

# Base16 Shell
if status --is-interactive
  set BASE16_SHELL "$HOME/.config/base16-shell/"
  source "$BASE16_SHELL/profile_helper.fish"
end

# Promptline
function fish_prompt
  env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash ~/.promptline.sh left
end

function fish_right_prompt
  env FISH_VERSION=$FISH_VERSION PROMPTLINE_LAST_EXIT_CODE=$status bash ~/.promptline.sh right
end

# Lua env
set -x PATH $HOME/.lenv/bin $PATH
set -x PATH $HOME/.lenv/current/bin $PATH
set -x PATH $HOME/.luarocks/current/bin $PATH
set -x LUA_PATH './?.lua;/home/tom/.lenv/current/luarocks/share/?.lua;/home/tom/.lenv/current/luarocks/share/?/init.lua;'
set -x LUA_CPATH './?.so;/home/tom/.lenv/current/luarocks/lib/?.so;;'
