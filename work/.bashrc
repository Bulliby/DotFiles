alias 2.='cd ../..'
alias 3.='cd ../../..'
alias 4.='cd ../../../..'
alias 5.='cd ../../../../..'
alias 6.='cd ../../../../../..'

alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias d='dirs -v | head -10'

alias ls="ls --color=always"
export LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"

alias l='ls -lAh'
alias ll='ls -lah'

alias gr="grep -ri"
alias gro="grep -rio"
alias grl="grep -Ri"

alias ga='git add .'
alias gt='git status'
alias gc='git commit -m'
alias gd='git diff'
alias gl='git log --graph --decorate --oneline --all'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"

alias a="php artisan"
alias see="a migrate:refresh && a db:seed"
alias gnos='grep -nr --color=always --exclude-dir="dist" --exclude-dir="node_modules"  --exclude-dir="logs" --exclude-dir="cache" --exclude="tags" --exclude-dir="vendor" --exclude-dir="local/vendor" --exclude="*min*.js" --exclude="*min*.scss" --exclude=".php_cs.cache"'
alias glar='grep -nr --color=always --exclude-dir="node_modules"  --exclude-dir="storage"  --exclude-dir="vendor" --exclude-dir="nova" --exclude-dir="public" --exclude="tags" --exclude-dir="storage"'
alias d="dirs -v"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/vim/src:$HOME/.rbenv/versions/2.2.2/bin:$PATH"
umask 0002
export GITHUB_TOKEN="toto"
export GITHUB_USER="toto"

PATH="/home/lyon/wells/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/lyon/wells/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/lyon/wells/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/lyon/wells/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/lyon/wells/perl5"; export PERL_MM_OPT;

stty -ixon

jd()
{
    cd "$(dirs -l -"$1")"
}
