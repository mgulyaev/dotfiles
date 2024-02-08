# Clone zcomet if necessary
# if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
#   command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
# fi

fpath=(~/completions $fpath)
source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# zcomet load "themes/clean", from:oh-my-zsh

zcomet load 'mafredri/zsh-async'
zcomet load 'sindresorhus/pure'

# zcomet load "plugins/compleat", from:oh-my-zsh
# zcomet load "lib/completion", from:oh-my-zsh
zcomet snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/lib/completion.zsh
zcomet snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/compleat/compleat.plugin.zsh

zcomet load "zsh-users/zsh-syntax-highlighting"
zcomet load "zsh-users/zsh-history-substring-search"

zcomet compinit

stty start undef
stty stop undef

setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks

setopt no_flow_control
setopt nonomatch

alias svn=~/bin/svn-color.py
alias svndiff=~/.svndiff.sh
alias svnvdiff='svn diff --diff-cmd=svndiff_helper'
alias grep='grep --color'
# alias open=xdg-open
alias ls='ls --color=auto'

alias lsregister=/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Versions/Current/Support/lsregister

zstyle ':completion:*' menu select

bindkey -e
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=none,fg=bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=none'

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/z/z.sh ] && source /usr/share/z/z.sh

if type "fd" > /dev/null; then
    export FZF_DEFAULT_COMMAND='fd --type f'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';

export LS_COLORS

bindkey "^[[H" beginning-of-line     # Home
bindkey "^[OH" beginning-of-line     # Home
bindkey "^[[F" end-of-line           # End
bindkey "^[OF" end-of-line           # End
bindkey "^[[1;5C" forward-word       # Ctrl+<right arrow>
bindkey "^[[1;5D" backward-word      # Ctrl+<left arrow>
bindkey "^[[2~" quoted-insert        # Ins
bindkey "^[[3~" delete-char          # Del
bindkey "^[[5~" beginning-of-history # PageUp
bindkey "^[[6~" end-of-history       # PageDown
bindkey "^[[Z" reverse-menu-complete # Shift+Tab

bindkey "\e[1~" beginning-of-line    # Home
bindkey "\e[4~" end-of-line          # End
bindkey "\e[5C" forward-word         # Ctrl+<right arrow>
bindkey "\e\e[C" forward-word        # Ctrl+<right arrow>
bindkey "\e[5D" backward-word        # Ctrl+<left arrow>
bindkey "\e\e[D" backward-word       # Ctrl+<left arrow>
bindkey "\e[2~" quoted-insert        # Ins
bindkey "\e[3~" delete-char          # Del
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history       # PageDown
bindkey "\e[Z" reverse-menu-complete # Shift+Tab

export TERMINAL=gnome-terminal
export EDITOR=vim
export BAT_THEME=TwoDark
