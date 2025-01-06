# Disable fish greeting
set -g fish_greeting ""

# TokyoNight Color Palette
set -l foreground c8d3f5
set -l selection 2d3f76
set -l comment 636da6
set -l red ff757f
set -l orange ff966c
set -l yellow ffc777
set -l green c3e88d
set -l purple fca7ea
set -l cyan 86e1fc
set -l pink c099ff

# Cursor
set -g set fish_cursor_default block

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_option $pink
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment
set -g fish_pager_color_selected_background --background=$selection

# fish git prompt
set __fish_git_prompt_show_informative_status yes

set __fish_git_prompt_color_branch green
set __fish_git_prompt_color_dirtystate yellow
set __fish_git_prompt_color_merging red
set __fish_git_prompt_color_stagedstate green
set __fish_git_prompt_color_stashstate blue
set __fish_git_prompt_color_upstream_ahead yellow
set __fish_git_prompt_color_upstream_behind yellow
set __fish_git_prompt_describe_style branch
set __fish_git_prompt_showdirtystate yes
set __fish_git_prompt_showstashstate yes
set __fish_git_prompt_showuntrackedfiles yes
set __fish_git_prompt_showupstream auto

# Status Chars
set __fish_git_prompt_char_cleanstate '✔'
set __fish_git_prompt_char_conflictedstate x
set __fish_git_prompt_char_dirtystate 𝚫
set __fish_git_prompt_char_invalidstate x
set __fish_git_prompt_char_stagedstate '●'
set __fish_git_prompt_char_stateseparator ''
set __fish_git_prompt_char_untrackedfiles '+'
set __fish_git_prompt_char_upstream_ahead '⬆ '
set __fish_git_prompt_char_upstream_behind '⬇ '
set __fish_git_prompt_char_upstream_diverged '⬆⬇'
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_prefix ''

function fish_prompt --description 'Write out the prompt'
    set -l pwd (printf "%s%s%s" (set_color $fish_color_cwd) (prompt_pwd -D 2) (set_color normal))
    set -l prompt_symbol ''
    set -l time (printf "%s%s%s" (set_color green) (date +%H:%M) (set_color normal))
    set -l username (printf "%s%s%s" (set_color red) $USER (set_color normal))

    switch "$USER"
        case root toor
            set prompt_symbol '#'
        case '*'
            set prompt_symbol '$'
    end

    printf "%s [%s@%s]%s%s " $time $username $pwd $prompt_symbol (__fish_git_prompt)
end

#
# Environment Variables
#

set -xg EDITOR hx
set -xg BROWSER x-www-browser:chromium
set -xg KERL_BUILD_DOCS yes
set -xg KUBE_EDITOR hx
set -xg TERM screen-256color
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

alias clipb="xclip -selection clipboard"

alias ll="lsd -l"
alias la="lsd -la"
