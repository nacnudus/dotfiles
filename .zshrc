# START OF ZPLUG STUFF #########################################################

# Use nerd fonts (must specify before loading powerlevel9k)
POWERLEVEL9K_MODE='nerdfont-complete'

source ~/.zplug/init.zsh

# Manages itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Ordinary plugins
zplug "lib/history",   from:oh-my-zsh
zplug "lib/completion",   from:oh-my-zsh
zplug "lib/compfix",   from:oh-my-zsh
zplug "lib/conda",   from:oh-my-zsh
zplug "lib/correction",   from:oh-my-zsh
zplug "lib/directories",   from:oh-my-zsh
zplug "lib/functions",   from:oh-my-zsh
zplug "lib/keybindings",   from:oh-my-zsh
zplug "lib/misc",   from:oh-my-zsh
zplug "plugins/gitfast",   from:oh-my-zsh
zplug "plugins/fasd",   from:oh-my-zsh
zplug "plugins/pip",   from:oh-my-zsh
zplug "plugins/vi-mode",   from:oh-my-zsh
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug "molovo/tipz" # Gives you helpful hints when you execute a command for which you have an alias defined
zplug "peterhurford/up.zsh" # Type up 5 to move up five directories
zplug "supercrabtree/k" # k is the new l, with git context
zplug "zlsun/solarized-man" # syntax-highlighted man-pages
zplug "psprint/zsh-navigation-tools" # syntax-highlighted man-pages

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

# START OF PROMPT STUFF ########################################################

# Begin on a new line
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

# Prompt elements
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir anaconda rbenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs background_jobs battery)

# END OF PROMPT STUFF ##########################################################

# # Load the custom .*-pass I have
# for i in ~/.*-pass; do
#   [ -e $i/.load.zsh ] && . $i/.load.zsh
# done

# Alias for listing with human-readable file sizes, and dotfiles
alias l="k -ha"

# Aliases for updating
alias updatetest="yaourt -Syua"
alias updatereal="yaourt -Syua --noconfirm"

# Alias vim for vim-R-plugin
# alias vim="vim --servername VIM"

# Alias to load R without .Rprofile for using rhub without colorout
alias rhub="R --no-init-file"

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
alias x50="xbacklight -set 50"
alias x25="xbacklight -set 25"
alias x1="xbacklight -set 1"
alias x0="xbacklight -set 0"

# Aliases for HDMI1
alias hdmion="xrandr --output HDMI1 --auto --above eDP1"
alias hdmioff="xrandr --output HDMI1 --off"

# Alias for replacing spaces with dashes in filenames
alias dashify="zmv -n '(**/)(* *)' '$1${2//( #-## #| ##)/-}'"

# Aliases for connecting to eduroam (don't seem to work yet)
alias eduroam="sudo wpa_supplicant -c. /home/nacnudus/dotfiles/eduroam -i wlp2s0 -D nl80211 -B"
alias ip="sudo dhcpcd wlp2s0"

# Alias for knitr/kicker
alias knitr="/home/nacnudus/dotfiles/knitr.kick"

# Aliases for zathura pdf reader
# Fork into background 
alias pdf="zathura --fork"
# Switch light/dark
alias pdfdark="cp /home/nacnudus/.config/zathura/zathurarc-dark /home/nacnudus/.config/zathura/zathurarc"
alias pdflight="cp /home/nacnudus/.config/zathura/zathurarc-light /home/nacnudus/.config/zathura/zathurarc"

# Aliases for i3
alias i3dark="cp /home/nacnudus/.i3/config-dark /home/nacnudus/.i3/config; i3-msg reload"
alias i3light="cp /home/nacnudus/.i3/config-light /home/nacnudus/.i3/config; i3-msg reload"
# alias i3dark='cat .i3/config-base16-default-dark .i3/base > .i3/config && i3-msg reload'
# alias i3light='cat .i3/config-base16-default-light .i3/base > .i3/config && i3-msg reload'

# Aliases for gnome terminal dark/light
alias termdark="/home/nacnudus/gnome-terminal-colors-solarized/set_dark.sh"
alias termlight="/home/nacnudus/gnome-terminal-colors-solarized/set_light.sh"
# alias termdark="base16_solarized-dark"
# alias termlight="base16_solarized-light"

# Aliases for prompt (Promptline) dark/light
alias promptdark="ln -fs $HOME/dotfiles/.shell_prompt_dark.sh $HOME/.shell_prompt.sh; source $HOME/.shell_prompt.sh"
alias promptlight="ln -fs $HOME/dotfiles/.shell_prompt_light.sh $HOME/.shell_prompt.sh; source $HOME/.shell_prompt.sh"

# Aliases for dark/light combined
alias dark="pdfdark; i3dark; termdark; promptdark"
alias light="pdflight; i3light; termlight; promptlight"

# Alias for magit
alias magit="nvim -c MagitOnly"

# Aliases for copyediting
# Move relevant materials to working directory
alias getmaterials="cp /home/nacnudus/copyediting/materials/notes.md /home/nacnudus/copyediting/materials/templates.tex /home/nacnudus/copyediting/materials/mms.bst /home/nacnudus/copyediting/materials/SageVnatbib.bst /home/nacnudus/copyediting/materials/SAGE-LaTeX-template/SageH.bst /home/nacnudus/copyediting/materials/SAGE-LaTeX-template/sagej.cls /home/nacnudus/copyediting/materials/hyphenations.sh /home/nacnudus/copyediting/materials/acronyms.sh /home/nacnudus/copyediting/materials/.gitignore /home/nacnudus/copyediting/materials/SAGE-LaTeX-template/SAGE_Logo.eps /home/nacnudus/copyediting/materials/regex.txt ./"
alias openguides="pdf /home/nacnudus/copyediting/materials/SAGE-editing-September-2016-READ-THIS-FILE-FIRST.pdf; pdf /home/nacnudus/copyediting/materials/SAGE\ UK\ Style\ Guide\ 28\ Oct\ 2011-with\ comments\ 1\ Nov\ 2012.pdf; pdf /home/nacnudus/copyediting/materials/SAGE-LaTeX-template/Sage_LaTeX_Guidelines.pdf"

# Alias for wifi and tethering
alias tether="sudo dhcpcd enp0s20u2"
alias wifi="sudo wifi-menu"

# Alias to log out of git (unset credential helper)
alias gitlogout="git config --global --unset credential.helper"
alias gitlogin="git config --global credential.helper cache"

# Alias for restarting dunst notifications
alias notify="killall dunst;notify-send foo;notify-send bar"

# nvm (nodejs version manager)
# source /usr/share/nvm/init-nvm.sh

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
export PATH=$PATH:$HOME/.gem/ruby/2.4.0/bin # Add ruby gem path for vim-github-dashboard
export PATH=$PATH:$HOME/.cabal/bin # Add cabal to PATH for pandoc
export PATH=$PATH:/usr/local/texlive/2016/bin/x86_64-linux # TeXLive
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/home/nacnudus/miniconda3/bin # anaconda (don't override existing python)
# export GITHUB_PAT=e079fe8515a664ec6b3598a55ebd8f125274a0b4

# load rvm (ruby version manager)
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/gds_rsa
# Load ssh stuff (mainly for github)
################################################################################
SSH_ENV="$HOME/.ssh/environment"
function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
    /usr/bin/ssh-add ~/.ssh/gds_rsa;
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
################################################################################

PERL_MB_OPT="--install_base \"/home/nacnudus/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/nacnudus/perl5"; export PERL_MM_OPT;
