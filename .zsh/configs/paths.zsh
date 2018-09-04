export PATH=$HOME/bin:/usr/local/bin:$PATH

if [ -d "$HOME/.asdf" ]; then
  . $HOME/.asdf/asdf.sh
fi

if type 'yarn' > /dev/null; then
  export PATH="$PATH:$(yarn global bin)"
fi

export -U PATH
