DOTFILES=~/.dotfiles

files=()
files+=(.bash_profile)
files+=(.ctags)
files+=(.gitconfig)
files+=(.ssh)
files+=(.vimrc)
files+=(.gvimrc)
files+=(.tigrc)
files+=(.tmux.conf)
files+=(Brewfile)

for i in ${files[@]}; do
  ln -sf ${DOTFILES}/${i} ~/${i}
done

# other install 

## node
### nvm
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash

### install node

### npm
npm install -g electron-prebuilt
npm install -g jade
npm install -g coffee-script
