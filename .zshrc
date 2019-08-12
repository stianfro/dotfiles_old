export ZSH="/home/stian/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh
eval `dircolors ~/.hiddengit/dircolors-solarized/dircolors.256dark`

gclone() {
  dir=$(echo $1 | sed 's/^http\(s*\):\/\///g' | sed 's/^git@//g' | sed 's/\.git$//g' | sed 's/:/\//g' )
  git clone $1  "$HOME/src/$dir"
  cd "$HOME/src/$dir"
}
goclone() {
  OPEN_CODE=true
  while getopts nc: option
  do
  case "${option}"
  in
  nc) OPEN_CODE=false
  esac
  done
  dir=$(echo $1 | sed 's/^http\(s*\):\/\///g' | sed 's/^git@//g' | sed 's/\.git$//g' | sed 's/:/\//g' )
  git clone $1  "$HOME/go/src/$dir"
  cd "$HOME/go/src/$dir"
  if [ "$OPEN_CODE" = true ] ; then
    code "$HOME/go/src/$dir"
  fi
}
