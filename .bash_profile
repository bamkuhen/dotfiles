#for git
git_branch() {
  echo $(git branch --no-color  2>/dev/null | sed -ne "s/^\* \(.*\)$/\1/p")
}
export PS1='\[\033[0;33m\]\W/ \[\033[1;30m\]\t \[\033[1;32m\]$(git_branch)\[\033[0m\] $ '
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

#other
export PATH=$PATH:~/bin

