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

# completion
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

# for ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


# for boot2docker
eval "$(boot2docker shellinit)"

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
