alias vim='nvim'
alias vimconfig='vim ~/.config/nvim/init.lua'
alias zconfig='vim ~/.zshrc'
alias kt='cd /Users/flatironschool/Development/kinkytowers1/'
alias stage='cd /Users/flatironschool/Development/stage/'
alias fishconfig='vim ~/.config/fish/config.fish'

# aliases
alias br='git branch'
alias ci='git commit -m'
alias gst='git status'
alias gd='git diff'
alias co='git checkout'
alias co='git checkout'
alias cob='git checkout -b'

# tmux aliases

alias xn='tmux new-session -t'
alias xk='tmux kill-session -t'
alias xat='tmux attach -t'
alias xls='tmux ls'

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

if type rg &> /dev/null; 
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
end


if status is-interactive
    # Commands to run in interactive sessions can go here
end
