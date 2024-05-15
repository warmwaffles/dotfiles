# Disable fish greeting
set -g fish_greeting ""

# Dracula Color Palette
set -l foreground 383a42
set -l selection 44475a
set -l comment a0a1a7
set -l red d52753
set -l orange df631c
set -l yellow df631c
set -l green 23974a
set -l purple 823ff1
set -l cyan 27618d
set -l pink ce33c0

# Syntax Highlighting Colors
set -g fish_color_autosuggestion 8A9199
set -g fish_color_command        55B4D4
set -g fish_color_comment        ABB0B6
set -g fish_color_cwd            399EE6
set -g fish_color_end            ED9366
set -g fish_color_error          F51818
set -g fish_color_escape         4CBF99
set -g fish_color_match          F07171
set -g fish_color_normal         575F66
set -g fish_color_operator       FF9940
set -g fish_color_param          575F66
set -g fish_color_quote          86B300
set -g fish_color_redirection    A37ACC
set -g fish_color_search_match --background FF9940
set -g fish_color_selection      FF9940

# color for fish default prompts item
set -g fish_color_cancel      FAFAFA
set -g fish_color_host        A37ACC
set -g fish_color_host_remote A37ACC
set -g fish_color_user        FA8D3E

# Completion Pager Colors
set -g fish_pager_color_progress ABB0B6
set -g fish_pager_color_prefix 55B4D4
set -g fish_pager_color_completion 575F66
set -g fish_pager_color_description ABB0B6

# fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow

# Status Chars
set __fish_git_prompt_char_dirtystate 'x'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

function fish_prompt --description 'Write out the prompt'
    set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
    set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
    set -l prompt_symbol ''

    switch "$USER"
    case root toor
        set prompt_symbol '#'
    case '*'
        set prompt_symbol '$'
    end

    printf "[%s%s%s@%s%s%s]%s%s " (set_color red) $USER (set_color normal) (set_color $fish_color_cwd) $pwd (set_color normal) $prompt_symbol (__fish_git_prompt)
end

#
# Environment Variables
#

set -xg EDITOR nvim
set -xg BROWSER x-www-browser:chromium
set -xg KERL_BUILD_DOCS yes
set -xg KUBE_EDITOR "nvim"
set -xg TERM xterm
set -xg SXHKD_SHELL sh
set -xg GNUPGHOME /home/warmwaffles/.gnupg
set -xg _JAVA_AWT_WM_NONREPARENTING 1

set -xg XDG_CONFIG_HOME $HOME/.config
set -xg XDG_CACHE_HOME $HOME/.cache
set -xg XDG_DOWNLOADS $HOME/downloads
set -xg XDG_DATA_HOME $HOME/.local/share
set -xg XDG_STATE_HOME $HOME/.local/state

set -g fish_user_paths $HOME/.local/bin $fish_user_paths
set -g fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -g fish_user_paths $HOME/go/bin $fish_user_paths

# SV4GIT
set -xg SV4GIT_HOME $HOME/.config/sv4git

if status is-interactive
  # Commands to run in interactive sessions can go here
  mise activate -s fish | source

  direnv hook fish | source
end

# Aliases
function utcnow -d "Gives an iso8601 string"
    date -u +"%Y-%m-%dT%TZ"
end
