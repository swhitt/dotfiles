export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1 "(%s)")\$ '

export PATH="~/bin:/usr/local/bin:/usr/local/sbin:/usr/local/oracle/instantclient_10_2:/usr/local/share/python:$PATH"
export EDITOR='subl -w'
export CC=gcc-4.2
export NLS_LANG="AMERICAN_AMERICA.UTF8"
export DYLD_LIBRARY_PATH=/usr/local/sbin:/usr/local/oracle/instantclient_10_2
# Hack to use 32-bit ruby for oracle, see rvmrc in a oracle project for details
export USE_32BIT_FOR_ORACLE=true

# git-specific
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gd='git diff | subl -n -b'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias git=hub

# load git completion aliases from homebrew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
. /usr/local/etc/bash_completion.d/git-completion.bash
. /usr/local/etc/bash_completion.d/git-prompt.sh
. /usr/local/etc/bash_completion.d/ack.bash_completion.sh



# use the colors
alias ls='ls -G'

# z - see https://github.com/rupa/z
. `brew --prefix`/etc/profile.d/z.sh


# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias whois="whois -h whois-servers.net"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# File size
alias fs="stat -f \"%z bytes\""

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Start an HTTP server from a directory
alias server="open http://localhost:8080/ && python -m SimpleHTTPServer 8080"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Larger bash history (allow 32³ entries; default is 500)
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups

# Make some commands not show up in history
export HISTIGNORE="ls:ls *"

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Create a new directory and enter it
function md() {
  mkdir -p "$@" && cd "$@"
}

# load me some rvm
[[ -s "/Users/swhitt/.rvm/scripts/rvm" ]] && source "/Users/swhitt/.rvm/scripts/rvm"  # This loads RVM into a shell session.
