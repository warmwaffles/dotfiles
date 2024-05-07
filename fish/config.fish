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
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_match --background=$selection
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

set -xg EDITOR subl
set -xg BROWSER x-www-browser:chromium
set -xg KERL_BUILD_DOCS yes
set -xg NNN_FIFO "/tmp/nnn.fifo"
set -xg KUBE_EDITOR "vim"
set -xg TERM xterm
set -xg SXHKD_SHELL sh
set -xg GNUPGHOME /home/warmwaffles/.gnupg
set -xg _JAVA_AWT_WM_NONREPARENTING 1

set -U fish_user_paths $HOME/.local/bin $fish_user_paths
set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -U fish_user_paths $HOME/go/bin $fish_user_paths

# SV4GIT
set -xg SV4GIT_HOME $HOME/.config/sv4git

if status is-interactive
  # Commands to run in interactive sessions can go here
  mise activate -s fish | source

  direnv hook fish | source
end
