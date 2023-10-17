#!/bin/bash

# ERRORS CODE

E_BADARGS=11
E_BADLOCATION=12
E_MISSING_VAR=13
E_UNAVAILABLE_ENV=14
E_MISSING_DEPENDNCIES=15

# CONST

TARGETS_FOLDER="Targets"

usage()
{
    cat <<UsagePrint
Usage :
    ./deploy.bash -t target [-d] [-h]
    ./deploy.bash --target target [--debug] [--help]
    Target: Is mandatory and represent a configuration directory in Tragets
    Debug: Stop on exception and show execution script line by line (set -x)
    Help : Print this help
UsagePrint

    exit $E_BADARGS
}

set -e

options=$(getopt -a "$(basename $0)" -l "target:,help,debug" -- "t:hd" "$@" || { usage >&2 && false; })
# {....} is grouping output see : https://www.linux.com/topic/desktop/all-about-curly-braces-bash/

eval set --$options


while [ ! -z "$1" ]
do
	case "$1" in
		-t) target="$2"; shift ;;
		-h) usage ;;
		-d) debug=1 ;;
		--target) target="$2"; shift ;;
		--help) usage ;;
		--debug) debug=1 ;;
	esac
	shift
done

if [ -z "$target" ]; then
    echo "target option is mandatory"
    exit $E_BADARGS;
fi

close_stderr_stdout()
{
	exec 11>&1 12>&2 1>&- 2>&-     
}

restore_stderr_stdout()
{
	exec 1>&11 2>&12 11>&- 12>&-
}

clean()
{
    rm -${v}f $HOME/{.vimrc,.screenrc,.gitconfig,.gitignore_global,.alacritty.yml,.zshrc,.zsh_bindkey,.tmux.conf}
    rm -${v}f $HOME/.bashrc
    rm -r${v}f $HOME/.vim/bundle/*

    # L'expansion avec les accolad ne semble pas fonctionner pour les dossiers
    rm -${v}rf "$HOME/.oh-my-zsh" "$HOME/.vim" $HOME/.config/procps $HOME/.config/nvim
}


deploy()
{
    mkdir -p $HOME/.config/procps
    ln -s $ACTIVE_PATH/.vim $HOME/.vim
    ln -s $ACTIVE_PATH/.vimrc $HOME/.vimrc
    ln -s $ACTIVE_PATH/.screenrc $HOME/.screenrc
    ln -s $ACTIVE_PATH/.gitignore_global $HOME/.gitignore_global
    ln -s $ACTIVE_PATH/.gitconfig $HOME/.gitconfig
    ln -s $ACTIVE_PATH/.alacritty.yml $HOME/.alacritty.yml
    ln -s $ACTIVE_PATH/toprc $HOME/.config/procps/toprc 
    ln -s $ACTIVE_PATH/.bashrc $HOME/.bashrc
    ln -s $ACTIVE_PATH/.zshrc $HOME/.zshrc
    ln -s $ACTIVE_PATH/.zsh_bindkey $HOME/.zsh_bindkey
    ln -s $PWD/nvim $HOME/.config/nvim
    ln -s $ACTIVE_PATH/.tmux.conf $HOME/.tmux.conf

    git clone https://github.com/preservim/nerdtree.git $ACTIVE_PATH/.vim/bundle/nerdtree
    git clone https://github.com/dracula/vim.git $ACTIVE_PATH/.vim/bundle/dracula
    git clone https://github.com/vim-airline/vim-airline.git $ACTIVE_PATH/.vim/bundle/vim-airline
    git clone https://github.com/tpope/vim-commentary.git $ACTIVE_PATH/.vim/bundle/vim-commentary

    git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh

    #Packager
	curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

	cp robbyrussell.zsh-theme-pi $HOME/.oh-my-zsh/themes/robbyrussell.zsh-theme

}

debug()
{
	set -x
}

source ./src/check-project.bash
check

if [ $? -ne 0 ]; then
    exit $?
fi

cat <<'WARNING'
    Be careful all your configuration's file in your home will be supressed and
    taken from my git.
WARNING

echo -n 'Are you sure ? (type "No" to quit) '
read answer

if [[ $answer == "No" ]]; then
    exit 0
fi

ACTIVE_PATH="$PWD/Targets/$target"

if [[ $debug -eq 1 ]]; then
    debug
else
    close_stderr_stdout
fi

clean
deploy

CUSTOMS_SCRIPT=$(find  $ACTIVE_PATH/custom.d/ -type f -name "*.bash");

if [ ! -z $CUSTOMS_SCRIPT ]; then
    for s in $CUSTOMS_SCRIPT; do
        source $s
    done
fi

restore_stderr_stdout

exit 0
