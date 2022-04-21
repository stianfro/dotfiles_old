# git aliases
function ga --wraps='git add -A' --description 'alias ga=git add -A'
    git add -A $argv
end
function gam --wraps='git commit -am' --description 'alias gam=git commit -am'
    git commit -am $argv
end
function gf --wraps='git diff' --description 'alias gf=git diff'
    git diff $argv
end
function gm --wraps='git commit -m' --description 'alias gm=git commit -m'
    git commit -m $argv
end
function gp --wraps='git push' --description 'alias gp=git push'
    git push $argv
end
function gpt --wraps='git push --tags' --description 'alias gpt=git push --tags'
    git push --tags $argv
end
function gt --wraps='git tag' --description 'alias gt=git tag'
    git tag $argv
end

# other stuff
function gclone -d "Clone a directory to a sensible path"
    set dir (echo $argv | sed 's/^http\(s*\):\/\///g' | sed 's/^git@//g' | sed 's/\.git$//g' | sed 's/:/\//g')
    git clone $argv "$HOME/src/$dir"
    cd "$HOME/src/$dir"
end