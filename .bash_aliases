# VIM
alias v="vim"

# ------
# Git
# ------
alias g='git'
alias gcl='git clone'
# Branch
alias gb='git branch'
alias gba='git branch -a'
# Commit
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit -a'
alias gcam='git commit -am'
alias gmessage='git commit --amend -m' # Indicar nuevo mensaje
# Log
alias gl='git log'
alias glg="git log --graph --pretty=format:'%Cblue%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
# Remotes
alias gr='git remote'
alias grl='git remote -v'  # List branches
alias gra='git remote add'
alias grrm='git remote rm'
# Status
alias gs='git status'
alias gss='git status -s'  # Simple status
# Misc
alias gpl='git pull'
alias gps='git push'
alias ga='git add'
alias gco='git checkout'
alias gd='git diff'
alias gitback='git checkout -b old-state' # indicar id de commit
alias gnochange='git update-index --assume-unchanged' # indicar archivo a ignorar
alias gchange='git update-index --no-assume-unchanged' # indicar archivo a no ignorar

# GIT one letter
alias u='gpl'
alias p='gps'

# DJANGO
alias pm="python manage.py"
alias pmcs="python manage.py collectstatic --noinput"
alias pmdbsh="python manage.py dbshell"
alias pmdd="python manage.py dumpdata"
alias pmld="python manage.py loaddata"
alias pmm="python manage.py migrate"
alias pmsh="python manage.py shell"
alias pmshp="python manage.py shell_plus"
alias pmsm="python manage.py schemamigration"
alias pmsync="python manage.py syncdb --noinput"
alias pms="python manage.py syncdb"
alias pmt="python manage.py test"
alias prs="python manage.py runserver"

# DOCKER
#alias docker='sudo docker'
# Get latest container ID
alias dl="docker ps -l -q"
# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"
# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"
# Stop all containers
#dstop() { docker stop $(docker ps -a -q);})
alias ds="docker start"
alias dp="docker ps"
alias dpa="docker ps -a"
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

alias viewzip="unzip -l $1 | less"

#chdir
alias ..="cd .."
alias cdd="cd .."
alias cd..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias -- -='cd -'

#supervisor
alias supervisor="cd ~/projects/supervisores; sudo supervisord; sudo supervisorctl"

#Source
alias reload="source ~/.bashrc"

#SSH
function s() {
  scp ~/.bash_aliases $1:/tmp/.bash_aliases_temp
  ssh -t $1 "bash --rcfile /tmp/.bash_aliases_temp ; rm /tmp/.bash_aliases_temp"
}

#BASH
alias j=jobs


function restore_mysql() {
    DUMP_FILE=${DUMP_FILE:-$1}
    MYSQL_HOST=${MYSQL_HOST:-$2}
    MYSQL_USER=${MYSQL_USER:-$3}
    MYSQL_PASSWORD=${MYSQL_PASSWORD:-$4}
    MYSQL_DB=${MYSQL_DB:-$5}
    echo $DUMP_FILE;
    (
      echo "SET AUTOCOMMIT=0;"
      echo "SET UNIQUE_CHECKS=0;"
      echo "SET FOREIGN_KEY_CHECKS=0;"
      cat "$DUMP_FILE"
      echo "SET FOREIGN_KEY_CHECKS=1;"
      echo "SET UNIQUE_CHECKS=1;"
      echo "SET AUTOCOMMIT=1;"
      echo "COMMIT;"
    ) | mysql -h "$MYSQL_HOST" -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DB"
}
