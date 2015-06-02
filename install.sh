BASH_EXT="$HOME/.jw_bash_ext"
echo "Installing bash extensions for '$USER' to '$BASH_EXT'..."

touch $BASH_EXT
curl -L# "https://raw.githubusercontent.com/jwark/.bash_ext/master/.bash_ext" -o $BASH_EXT
SOURCE_CMD="source $BASH_EXT"

function addSourceIfNeeded {
  DOT_FILE=$1

  if ! grep -Fxq "$SOURCE_CMD" $DOT_FILE
  then
      echo "adding to $DOT_FILE"
      echo $SOURCE_CMD >> $DOT_FILE
  fi
}

if [ -f "$HOME/.bash_profile" ]
then
  addSourceIfNeeded "$HOME/.bash_profile"
elif [ -f "$HOME/.bashrc" ]
then
  addSourceIfNeeded "$HOME/.bashrc"
else
  echo "Cannot find .bashrc or .bash_profile, extensions not installed."
fi
