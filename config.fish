alias bs='bin/setup'
alias bd='bin/dev'
alias br='git branch'
alias ci='git commit -m'
alias gst='git status'
alias gd='git diff'
alias co='git checkout'
alias co='git checkout'
alias cob='git checkout -b'
alias grom='git rebase origin/main'

alias lococheck='yarn prettier-check -w && yarn tsc && yarn lint'

# alias ls='ls -lsh --color=auto | lolcat'
alias ls='ls -lsh --color=auto'
# alias bi='bundle install'
# alias ni='npm install'

# tmux aliases
# alias xnew='tmux new-session -t'
# alias xk='tmux kill-session -t'
# alias xat='tmux attach -t'
# alias xls='tmux ls'
abbr -a xat 'tmux attach -t'
# abbr -a tad 'tmux attach -d -t'
abbr -a xnew 'tmux new-session -s'
abbr -a xls 'tmux list-sessions'
# abbr -a tksv 'tmux kill-server'
abbr -a xk 'tmux kill-session -t'
abbr -a xrr 'tmux resize-pane -R 10'
abbr -a xrl 'tmux resize-pane -L 10'


#localyze alias
# alias bes='bundle exec rails s'
# alias beside='bundle exec sidekiq'
# alias fes='yarn start'

  # Set Spaceship ZSH as a prompt
# autoload -U promptinit; promptinit
# prompt spaceship

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

# if type rg &> /dev/null; then
#   export FZF_DEFAULT_COMMAND='rg --files'
#   export FZF_DEFAULT_OPTS='-m --height 50% --border'
# fi

alias vim='nvim'
alias vimconfig='vim ~/.config/nvim/init.lua'
alias kittyconfig='vim ~/.config/kitty/kitty.conf'
alias zconfig='vim ~/.zshrc'
alias fishconfig='vim ~/.config/fish/config.fish'

alias dev='cd ~/Code/'
alias loc='cd ~/Code/localyze/Backend/'
alias pluto='cd ~/Code/localyze/pluto/'
alias talent='cd ~/Code/localyze/talent-web/'
alias stage='cd ~/Code/stage/'

# if status is-interactive
#     # Commands to run in interactive sessions can go here
# end

function nvim-astro
    env NVIM_APPNAME=nvim-astro nvim
end

function default
    env NVIM_APPNAME= nvim
end

function nvim-chad
    env NVIM_APPNAME=nvim-chad nvim
end

function nvims
    set items default nvim-astro nvim-chad
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
    if [ -z $config ]
        echo "Nothing selected"
        return 0
    else if [ $config = "default" ]
        set config ""
    end
    env NVIM_APPNAME=$config nvim $argv
end

bind \ca nvims

source /opt/homebrew/opt/asdf/libexec/asdf.fish
