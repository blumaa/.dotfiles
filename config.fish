alias br='git branch'
alias ci='git commit -m'
alias gst='git status'
alias gd='git diff'
alias co='git checkout'
alias co='git checkout'
alias cob='git checkout -b'

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

if status is-interactive
    # Commands to run in interactive sessions can go here
end

source /opt/homebrew/opt/asdf/libexec/asdf.fish
