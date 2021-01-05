# START OF ZPLUG STUFF #########################################################

# Use nerd fonts (must specify before loading powerlevel9k)
POWERLEVEL9K_MODE='nerdfont-complete'

# Set default user, for whom the 'context' won't be displayed in the prompt
# (e.g. nacnudus@nactop)
DEFAULT_USER="nacnudus"

source ~/.zplug/init.zsh

# Manages itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Ordinary plugins
zplug "lib/history",   from:oh-my-zsh
zplug "lib/completion",   from:oh-my-zsh
zplug "lib/compfix",   from:oh-my-zsh
zplug "plugins/virtualenv",   from:oh-my-zsh
zplug "lib/correction",   from:oh-my-zsh
zplug "lib/directories",   from:oh-my-zsh
zplug "lib/functions",   from:oh-my-zsh
zplug "lib/keybindings",   from:oh-my-zsh
zplug "lib/misc",   from:oh-my-zsh
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/gitfast",   from:oh-my-zsh
zplug "plugins/fasd",   from:oh-my-zsh
# zplug "plugins/pip",   from:oh-my-zsh
zplug "plugins/vi-mode",   from:oh-my-zsh
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "molovo/tipz" # Gives you helpful hints when you execute a command for which you have an alias defined
zplug "MichaelAquilina/zsh-autoswitch-virtualenv" # auto virtualenv switcher
zplug "peterhurford/up.zsh" # Type up 5 to move up five directories
zplug "supercrabtree/k" # k is the new l, with git context
zplug "zlsun/solarized-man" # syntax-highlighted man-pages
zplug "psprint/zsh-navigation-tools" # multiline history searcher
zplug "johnhamelink/rvm-zsh", lazy:true

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zdharma/fast-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# END OF ZPLUG STUFF ###########################################################

# START OF SSH STUFF ###########################################################

# http://mah.everybody.org/docs/ssh#run-ssh-agent

SSH_ENV="$HOME/.ssh/environment"

function start_agent {
     echo "Initialising new SSH agent..."
     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
     echo succeeded
     chmod 600 "${SSH_ENV}"
     . "${SSH_ENV}" > /dev/null
     /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     #ps ${SSH_AGENT_PID} doesn't work under cywgin
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
         start_agent;
     }
else
     start_agent;
fi

# START OF SSH STUFF ###########################################################

# START OF PROMPT STUFF ########################################################

# solarized light/dark
POWERLEVEL9K_COLOR_SCHEME='dark'

# Begin on a new line
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

# Prompt elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir anaconda virtualenv rbenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs background_jobs battery)

# END OF PROMPT STUFF ##########################################################

# conda completion https://github.com/esc/conda-zsh-completion/blob/master/_conda
zstyle ':completion::complete:*' use-cache 1

# Something to make Nvim-R work
setopt extendedglob

bindkey "" znt-history-widget

# Load the custom .*-pass I have
for i in ~/.*-pass; do
  [ -e $i/.load.zsh ] && . $i/.load.zsh
done

# Aliases for ping
alias p1="ping 1.1.1.1"
alias p8="ping 8.8.8.8"
alias pg="ping www.google.com"

# Alias for hub instead of git
eval "$(hub alias -s)"

# Aliases for connecting to VPNs
alias gdsvpn="sudo openconnect -b https://maximus.digital.cabinet-office.gov.uk/byod -u duncangarmonsway --csd-wrapper /home/nacnudus/dotfiles/csd-wrapper.sh"
alias ahvpn="sudo openconnect -b https://vpn.digital.cabinet-office.gov.uk/ah -u duncangarmonsway"
alias githubvpn="sudo openconnect -b https://vpn.digital.cabinet-office.gov.uk/github"
alias vpnoff="sudo killall openconnect"

# Alias for anbox android emulator
alias android="anbox launch --package=org.anbox.appmgr --component=org.anbox.appmgr.AppViewActivity"

# Alias for initialising normal ssh
alias sshid="eval \"$(ssh-agent)\";ssh-add ~/.ssh/id_rsa"

# Alias for initialising gds ssh
alias sshgds="eval \"$(ssh-agent)\";ssh-add ~/.ssh/gds_rsa"

# Alias for listing with human-readable file sizes, and dotfiles
alias l="k -ha"

# Aliases for updating
alias updatetest="yay -Syua"
alias updatereal="yay -Syua --noconfirm"

# Alias to load R without .Rprofile for using rhub without colorout
alias rhub="R --no-init-file"

# Alias for nvim with one keystroke
alias e="nvim"

# Alias to use nvim instead of vim
alias vim="nvim"

# Alias citrix for opening Citrix
alias citrix="/opt/Citrix/ICAClient/wfica ~/Downloads/launch.jsp"

# Alias windows for mounting C:\ of a Windows virtualbox
alias windowson="sudo mount -t cifs //192.168.56.101/c /home/nacnudus/windows -o user=nacnu,rw,gid=1000,uid=1000"
alias windowsoff="sudo umount /home/nacnudus/windows"

# Alias for mounting backup drives
alias elements1on="mount /media/elements1"
alias elements2on="mount /media/elements2"
alias backuphome="sudo backintime --profile home backup"
alias backupfull="sudo backintime --profile full backup"
alias elements1off="umount /media/elements1"
alias elements2off="umount /media/elements2"

# Alias for backup up to B2 BackBlaze Cloud
alias backupcloud="
duplicity --no-encryption --verbosity 8 \
  --exclude /home/nacnudus/gds \
  --exclude /home/nacnudus/.cache \
  --exclude /home/nacnudus/.config/google-chrome \
  --exclude /home/nacnudus/R/x86_64-pc-linux-gnu-library \
  --exclude /home/nacnudus/pricepaid \
  /home b2://51802ef89485:002adf30676c6847c6a0123c09024721e052d7246f@nactop-home/
"
# To restore a file
# duplicity restore --no-encryption --file-to-restore nacnudus/.ICEauthority b2://51802ef89485:002adf30676c6847c6a0123c09024721e052d7246f@nactop-home/ ./ICEauthority

# Alias for mounting usb sticks
alias sdbon="sudo mount /dev/sdb1 /media/usb"
alias sdboff="sudo umount /media/usb"
alias sdcon="sudo mount /dev/sdc1 /media/usb"
alias sdcoff="sudo umount /media/usb"

# Alias for mounting Hilary's pink USB stick
alias hilaryon="sudo mount /media/hilary"
alias hilaryoff="sudo umount /media/hilary"

# Alias for mounting sd cards
alias sdon="sudo mount /dev/mmcblk0p1 /media/sdcard"
alias sdoff="sudo umount /media/sdcard"

# Aliases for backlight brightness
alias x100="xbacklight -set 100"
alias x75="xbacklight -set 75"
alias x50="xbacklight -set 50"
alias x25="xbacklight -set 25"
alias x5="xbacklight -set 5"
alias x1="xbacklight -set 1"
alias x0="xbacklight -set 0"

# Aliases for xrandr screen monitor things
alias monitor="xrandr"
alias hdmioff="xrandr --output HDMI1 --off; xrandr --output HDMI2 --off"
alias hdmi1on="xrandr --output HDMI1 --auto --above eDP1"
alias hdmi1off="xrandr --output HDMI1 --off"
alias hdmi2on="xrandr --output HDMI2 --auto --above eDP1"
alias hdmi2off="xrandr --output HDMI2 --off"
alias dp1on="xrandr --output DP1 --auto --above eDP1"
alias dp1off="xrandr --output DP1 --off"

# Alias for replacing spaces with dashes in filenames
alias dashify="zmv -n '(**/)(* *)' '$1${2//( #-## #| ##)/-}'"

# Aliases for connecting to eduroam (don't seem to work yet)
alias eduroam="sudo wpa_supplicant -c. /home/nacnudus/dotfiles/eduroam -i wlp2s0 -D nl80211 -B"
alias ip="sudo dhcpcd wlp2s0"

# Aliases for zathura pdf reader
# Fork into background
alias pdf="zathura --fork"
# Switch light/dark
alias pdfdark="cp /home/nacnudus/.config/zathura/zathurarc-dark /home/nacnudus/.config/zathura/zathurarc"
alias pdflight="cp /home/nacnudus/.config/zathura/zathurarc-light /home/nacnudus/.config/zathura/zathurarc"

# Aliases for vim/nvim
alias vimdark="sed -i \"s/^set background=light/set background=dark/\" /home/nacnudus/nvim/packages/basic.vimrc"
alias vimlight="sed -i \"s/^set background=dark/set background=light/\" /home/nacnudus/nvim/packages/basic.vimrc"

# Aliases for i3
alias i3gruvbox="cp /home/nacnudus/.i3/config-gruvbox-dark /home/nacnudus/.i3/config; i3-msg reload"
alias i3dark="cp /home/nacnudus/.i3/config-dark /home/nacnudus/.i3/config; i3-msg reload"
alias i3light="cp /home/nacnudus/.i3/config-light /home/nacnudus/.i3/config; i3-msg reload"
# alias i3dark='cat .i3/config-base16-default-dark .i3/base > .i3/config && i3-msg reload'
# alias i3light='cat .i3/config-base16-default-light .i3/base > .i3/config && i3-msg reload'

# Aliases for gnome terminal dark/light
alias termdark="/home/nacnudus/gnome-terminal-colors-solarized/set_gruvbox_dark.sh"
alias termlight="/home/nacnudus/gnome-terminal-colors-solarized/set_gruvbox_light.sh"

# Aliases for prompt (Promptline) dark/light
alias promptlight="sed -i -- \"s/^POWERLEVEL9K_COLOR_SCHEME='dark'$/POWERLEVEL9K_COLOR_SCHEME='light'/\" $HOME/dotfiles/.zshrc"
alias promptdark="sed -i -- \"s/^POWERLEVEL9K_COLOR_SCHEME='light'$/POWERLEVEL9K_COLOR_SCHEME='dark'/\" $HOME/dotfiles/.zshrc"

# Aliases for dark/light combined
alias dark="pdfdark; vimdark; i3gruvbox; termdark; promptdark"
alias light="pdflight; vimlight; i3gruvbox; termlight; promptlight"

# Alias for magit
alias magit="nvim -c MagitOnly"

# Aliases for copyediting
# Move relevant materials to working directory
alias getmaterials="cp /home/nacnudus/copyediting/materials/notes.md /home/nacnudus/copyediting/materials/templates.tex /home/nacnudus/copyediting/materials/mms.bst /home/nacnudus/copyediting/materials/SageVnatbib.bst /home/nacnudus/copyediting/materials/SAGE-LaTeX-template/SageH.bst /home/nacnudus/copyediting/materials/SAGE-LaTeX-template/sagej.cls /home/nacnudus/copyediting/materials/hyphenations.sh /home/nacnudus/copyediting/materials/acronyms.sh /home/nacnudus/copyediting/materials/.gitignore /home/nacnudus/copyediting/materials/SAGE-LaTeX-template/SAGE_Logo.eps /home/nacnudus/copyediting/materials/regex.txt ./"
alias openguides="pdf /home/nacnudus/copyediting/materials/SAGE-editing-September-2016-READ-THIS-FILE-FIRST.pdf; pdf /home/nacnudus/copyediting/materials/SAGE\ UK\ Style\ Guide\ 28\ Oct\ 2011-with\ comments\ 1\ Nov\ 2012.pdf; pdf /home/nacnudus/copyediting/materials/SAGE-LaTeX-template/Sage_LaTeX_Guidelines.pdf"

# Alias for wifi and tethering
alias tether="sudo dhcpcd enp0s20u2"
alias wifi="sudo wifi-menu"
alias wifirestart="sudo systemctl restart netctl-auto@wlp2s0.service"

# Alias to log out of git (unset credential helper)
alias gitlogout="git config --global --unset credential.helper"
alias gitlogin="git config --global credential.helper cache"

# Alias for restarting dunst notifications
alias notify="killall dunst;notify-send foo;notify-send bar"
alias notifyoff="notify-send \"DUNST_COMMAND_PAUSE\""
alias notifyon="notify-send \"DUNST_COMMAND_RESUME\""

# Aliases for Conda environments
alias mkenv3="conda create python=3 ipython jupyter pip -n "
alias mkenv2="conda create python=2 ipython jupyter pip -n "
alias rmenv="conda remove --all --name "
alias lsenv="conda info -e "
alias wo="source activate "
alias de="source deactivate "
alias jvim="jupyter contrib nbextension install --symlink --sys-prefix"

# Aliases for rocker
alias r3.1="docker run --user docker -u 0 -p 8000:8000 -ti rocker/r-ver:3.1 bash"
alias r3.2="docker run --user docker -u 0 -p 8001:8000 -ti rocker/r-ver:3.2 bash"
alias r3.3="docker run --user docker -u 0 -p 8002:8000 -ti rocker/tidyverse:3.3 bash"
alias r3.4="docker run --user docker -u 0 -p 8003:8000 -ti rocker/tidyverse:3.4 bash"
alias rlatest="docker run --user docker -u 0 -p 8004:8000 -ti rocker/tidyverse bash"
alias rdevel="docker run --user docker -u 0 -p 8005:8000 -ti rocker/tidyverse:devel bash"

# Alias for grepping -nonascii characters
alias nonascii="grep --color='auto' -P -n '[^\x00-\x7F]'"
#
# New terminal in the same directory
alias nt="gnome-terminal"

# nvm (nodejs version manager)
source /usr/share/nvm/init-nvm.sh

# Customize to your needs...

# Vim keybindings
bindkey -v

# Prevent oh-my-zsh sharing of history between sessions
setopt no_share_history

# Allow e.g. ~ as an 'alias' of cd ~/ (prevents 'permission denied' error, which
# is due to ~ otherwise being interpreted as an execute command)
setopt auto_cd

# With multios, date >foo >bar writes the date to two files, named 'foo' and
# 'bar'. Note that a pipe is an implicit redirection; thus date >foo | cat
# writes the date to the file 'foo', and also pipes it to cat.
setopt multios

export MANPATH=$MANPATH:/usr/local/texlive/2016/texmf-dist/doc/man
export INFOPATH=$INFOPATH:/usr/local/texlive/2016/texmf-dist/doc/info
export GOPATH=$HOME/go/
export JENA_HOME=$HOME/jena/apache-jena-3.4.0
export PATH="/usr/share/neo4j/bin/:$PATH" # Add cypher-shell for neo4j
export PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin # Add ruby gem path for vim-github-dashboard
export PATH=$PATH:$HOME/.cabal/bin # Add cabal to PATH for pandoc
export PATH=$PATH:/usr/local/texlive/2016/bin/x86_64-linux # TeXLive
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/miniconda3/bin # anaconda (don't override existing python)
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$JENA_HOME/bin
export PATH=$PATH:/home/nacnudus/python/conda-zsh-completion

PERL_MB_OPT="--install_base \"/home/nacnudus/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/nacnudus/perl5"; export PERL_MM_OPT;

export WINEPREFIX=$HOME/.PlayOnLinux/wineprefix/Office2010
export WINEARCH=win32

# Setup direnv for directory specific python environment variables
eval "$(direnv hook zsh)"
