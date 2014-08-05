DOTFILES=~/.dotfiles

files=()
files+=(.bash_profile)
files+=(.ctags)
files+=(.gitconfig)
files+=(.ssh)
files+=(.vimrc)
files+=(.gvimrc)
files+=(.tmux.conf)
files+=(Brewfile)

for i in ${files[@]}; do
  ln -sf ${DOTFILES}/${i} ~/${i}
done
