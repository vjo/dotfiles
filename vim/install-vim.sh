mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/tags ~/.vim/tmp/swap ~/.vim/tmp/backup

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

vim +BundleInstall +qall
