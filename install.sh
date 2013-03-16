BASH_EXT="$HOME/.jw_bash_ext"
echo "Installing bash extensions for '$USER' to '$BASH_EXT'..."

touch $BASH_EXT
curl -L "https://raw.github.com/jwark/.bash_ext/master/.bash_ext" -o $BASH_EXT
source $BASH_EXT

if [ -f "$HOME/.bash_profile" ]
then
  echo "source $BASH_EXT" >> $HOME/.bash_profile
else
  if [ -f "$HOME/.bashrc" ]
  then
    echo "source $BASH_EXT" >> $HOME/.bashrc
  else
    echo "Cannot find .bashrc or .bash_profile, extensions not installed."
  fi
fi
