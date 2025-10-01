#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export QT_STYLE_OVERRIDE=Adwaita-Dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
export GTK_THEME=Adwaita:dark

#source ~/Scripts/my-enviroment.sh

##############################################
#POWER PROFILES DAEMON
##############################################
alias perfor='powerprofilesctl set performance'
alias ballin='powerprofilesctl set balanced'
alias lwbat='powerprofilesctl set power-saver'
alias pp='powerprofilesctl'
##############################################
#AIRPLANE MODE
##############################################
alias airpon='rfkill block all'
alias airpoff='rfkill unblock all'
##############################################
#GUI
##############################################
alias rgbt='/usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland'
alias sprbt='exec hyprland'
#alias nome='XDG_SESSION_TYPE=wayland dbus-run-session gnome-session'

#####UPDATE#####
alias upbsh='source ~/.bashrc'
alias upzsh='source ~/.zshrc'

############################################
#COOL SHIT
############################################
alias ff='fastfetch -l "arch2"'
alias afk='cmatrix | lolcat'
alias sspls='cbonsai -il'
alias mus='bash ~/Scripts/musicon.sh'
alias muso='bash ~/Scripts/musicoff.sh'
alias brow='w3m'
alias pink='ping archlinux.org'
############################################
#SHORTS
############################################
alias z-lib='~/Games/z-library-2.4.3/z-library'
alias note='nano ~/notes/'

############################################
#POWER
############################################
alias rb='reboot'
alias byemom='shutdown now'


alias ls='ls --color=auto'
alias grep='grep --color=auto'

P1='%n %* %~}$ '
