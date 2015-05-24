mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/tags ~/.vim/tmp/swap ~/.vim/tmp/backup

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

vim +BundleInstall +qall

cd ~/.vim/bundle/Command-T/ruby/command-t
ruby extconf.rb
make
cd -

#cd ~/.vim/bundle/YouCompleteMe
#./install.sh --clang-completer
