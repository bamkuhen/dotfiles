#for git
git_branch() {
  echo $(git branch --no-color  2>/dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}
export PS1='\[\033[0;33m\]\h \W/ \[\033[1;30m\]\t \[\033[1;32m\]$(git_branch)\[\033[0m\] $ '
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

#other
export PATH=$PATH:~/bin
export EDITOR=/usr/bin/vim
alias macvim="open -a /Applications/MacVim.app"
alias macvimdiff="/Applications/MacVim.app/Contents/MacOS/mvimdiff"

# for iterm ssh color
#alias ssh=~/bin/ssh-host-color
export PATH=/usr/local/bin:$PATH


# for ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# for local settion
if [ -f ~/.dotfiles/local/.bashrc ]; then
	. ~/.dotfiles/local/.bashrc
fi

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bash history time format
HISTTIMEFORMAT='%Y-%m-%dT%T%z '

export LANG=ja_JP.UTF-8

