DOTFILES=~/.dotfiles

files=()
files+=(.bash_profile)
files+=(.ctags)
files+=(.gitconfig)
files+=(.vimrc)
files+=(.gvimrc)
files+=(.tigrc)
files+=(.tmux.conf)
files+=(Brewfile)

for i in ${files[@]}; do
  ln -sf ${DOTFILES}/${i} ~/${i}
done

# for vim
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# other install 

## node
mkdir ~/.nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash

# ruby
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build


# reload 
source ~/.bash_profile

### install node

### npm
#npm install -g electron-prebuilt
#npm install -g jade
#npm install -g coffee-script


