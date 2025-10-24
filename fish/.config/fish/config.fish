# Disable fish greeting
set -g fish_greeting ""

fish_config theme choose catppuccin_mocha

# Cursor
set -g set fish_cursor_default block

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

function opencode-use --description 'Symlink ~/.local/share/opencode to opencode-work or opencode-personal'
    set -l target_dir ""
    switch $argv[1]
        case work
            set target_dir ~/.local/share/opencode-work
        case personal
            set target_dir ~/.local/share/opencode-personal
        case '*'
            echo "Error: Invalid argument. Use 'work' or 'personal'."
            return 1
    end

    # Check if target directory exists
    if not test -d $target_dir
        echo "Error: Target directory $target_dir does not exist."
        return 1
    end

    # Remove existing symlink or directory if it exists
    if test -e ~/.local/share/opencode
        rm -rf ~/.local/share/opencode
    end

    # Create the symlink
    ln -s $target_dir ~/.local/share/opencode
    if test $status -eq 0
        echo "Successfully linked ~/.local/share/opencode to $target_dir"
    else
        echo "Error: Failed to create symlink."
        return 1
    end
end

alias clipb="xclip -selection clipboard"

alias l="eza -a"
alias la="eza -h -a"
alias ll="eza -h -l"
alias lla="eza -h -l -a"
