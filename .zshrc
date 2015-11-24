# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# if [ $TERM = "linux" ]; then
#     export TERM="fbterm"
# fi

# Try to sort out some decent colours.
# export TERM=xterm-256color
# [ -n "$TMUX" ] && export TERM=screen-256color

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="nacnudus"
# I found a theme I like that goes straight in here:
# Adapted from code found at <https://gist.github.com/1712320>.
setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt
# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}±"
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}●%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}
# Show different symbols as appropriate for various Git repository states
parse_git_state() {
  # Compose this value via multiple conditional appends.
  local GIT_STATE=""
  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi
  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi
  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi
  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi
  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi
  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi
  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi
}
# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
}
# Set the right-hand prompt
RPS1='$(git_prompt_string)'

# Alias vim for vim-R-plugin
alias vim="vim --servername VIM"

# Alias mbie for mounting the secure usb shared from a Windows virtualbox 
alias mbieon="sudo mount -t cifs //192.168.56.101/f /home/nacnudus/mbie -o user=mbie,password=mbie,rw,gid=1000,uid=1000"
alias mbieoff="sudo umount -l /home/nacnudus/mbie"

# Alias windows for mounting C:\ of a Windows virtualbox 
alias windowson="sudo mount -t cifs //192.168.56.101/c /home/nacnudus/windows -o user=nacnu,rw,gid=1000,uid=1000"
alias windowsoff="sudo umount /home/nacnudus/windows"

# Alias for mounting backup drives
alias elements1on="sudo mount /media/elements1"
alias elements2on="sudo mount /media/elements2"
alias elements1off="sudo umount /media/elements1"
alias elements2off="sudo umount /media/elements2"

# Alias for mounting usb sticks
alias sdbon="sudo mount /dev/sdb1 /media/usb"
alias sdboff="sudo umount /media/usb"
alias sdcon="sudo mount /dev/sdc1 /media/usb"
alias sdcoff="sudo umount /media/usb"

# Aliases for backlight brightness
alias x100="xbacklight -set 100"
alias x50="xbacklight -set 50"
alias x1="xbacklight -set 1"

# Aliases for HDMI1
alias hdmion="xrandr --output HDMI1 --auto --above eDP1"
alias hdmioff="xrandr --output HDMI1 --off"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git desk)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Vim keybindings
bindkey -v

# Search history
bindkey '^R' history-incremental-search-backward

# Prevent oh-my-zsh sharing of history between sessions
setopt no_share_history

# virtualenv and virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs    
export PROJECT_HOME=$HOME/Devel          
source /usr/bin/virtualenvwrapper.sh

# chruby
# source /usr/share/chruby/chruby.sh
source /usr/share/chruby/auto.sh

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$HOME/.cabal/bin # Add cabal to PATH for pandoc
export PATH=$PATH:/usr/local/texlive/2015/bin/x86_64-linux # TeXLive
export MANPATH=$MANPATH:/usr/local/texlive/2015/texmf-dist/doc/man
export INFOPATH=$INFOPATH:/usr/local/texlive/2015/texmf-dist/doc/info

PERL_MB_OPT="--install_base \"/home/nacnudus/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/nacnudus/perl5"; export PERL_MM_OPT;
