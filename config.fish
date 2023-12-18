# aliases

alias vim='nvim'

alias vimconfig='vim ~/.config/nvim/init.lua'
alias zconfig='vim ~/.zshrc'
alias fishconfig='vim ~/.config/fish/config.fish'

alias dev='cd /Users/ablum/Development/'
alias port='cd /Users/ablum/Development/portfolio/portfolio-2023/'
alias kt='cd /Users/ablum/Development/kinkytowers/'

alias br='git branch'
alias ci='git commit -m'
alias gst='git status'
alias gd='git diff'
alias co='git checkout'
alias cob='git checkout -b'
alias grom='git rebase origin/main'

alias ls='ls -lsh --color=auto'

# tmux aliases
abbr -a xat 'tmux attach -t'
abbr -a xnew 'tmux new-session -s'
abbr -a xls 'tmux list-sessions'
abbr -a xk 'tmux kill-session -t'
abbr -a xrr 'tmux resize-pane -R 10'

# --------------------------------------------------------
# this is a custom function to switch branches easily 
# --------------------------------------------------------
function gbso
    git for-each-ref --sort=-committerdate refs/heads/ --format='%(refname:short)' | head -n 25
end

function gon
    gbso | head -n 15 | nl
    echo 'Which branch: '
    read branch_number
    set branch_name $(gbso | awk "NR==$branch_number" | tr -d ' ')
    git checkout $branch_name
    # update_current_git_vars # remove if not using zsh-git-prompt
end

if type rg &>/dev/null
    export FZF_DEFAULT_COMMAND='rg --files'
    export FZF_DEFAULT_OPTS='-m --height 50% --border'
end


if status is-interactive
    # Commands to run in interactive sessions can go here
end

# --------------------------------------------------------
# these are options for custom nvim environments
# --------------------------------------------------------
function AstroNvim
    env NVIM_APPNAME=AstroNvim nvim
end

function default 
    env NVIM_APPNAME=nvim
end

function LazyNvim 
    env NVIM_APPNAME=LazyNvim nvim
end

function nvims
    set items default AstroNvim LazyNvim 
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config = " --height=~50% --layout=reverse --border --exit-0)
    echo $config
    if [ -z $config ]
        echo "Nothing selected"
        return 0
    else if [ $config = default ]
        set config ""
    end
    env NVIM_APPNAME=$config nvim $argv
end

bind \ca nvims

export PATH="$HOME/.cargo/bin:$PATH"

source /usr/local/opt/asdf/libexec/asdf.fish
