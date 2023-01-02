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
    ./deploy.bash -t target [-v] [-d] [-h]
    ./deploy.bash --target target [--verbose] [--debug] [--help]
    Target: Is mandatory and represent a configuration directory in Tragets
    Verbose : Permit to see what is done at each step
    Debug: Stop on exception and show execution script line by line
    Help : Print this help
UsagePrint

    exit $E_BADARGS
}

set -e

options=$(getopt -a -n "$(basename $0)" -l "target:,help,verbose,debug" -- "t:hvd" "$@" || { usage >&2 && false; })
# {....} is grouping output see : https://www.linux.com/topic/desktop/all-about-curly-braces-bash/

eval set --$options


while [ ! -z "$1" ]
do
	case "$1" in
		-t) target="$2"; shift ;;
        -v) verbose=1 ;;
		-h) usage ;;
		-d) debug=1 ;;
		--target) target="$2"; shift ;;
		--help) usage ;;
		--debug) debug=1 ;;
        --verbose) verbose=1 ;;
	esac
	shift
done

v=""
if [[ $verbose ]]; then
    v="v"
fi

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
	exec 11>&1- 12>&2-     
}

clean()
{
    rm -${v}f $HOME/{.vimrc,.screenrc,.gitconfig,.gitignore_global,.alacritty.yml,.zshrc,.zsh_bindkey,.tmux.conf}
    rm -${v}f $HOME/.bashrc

    # L'expansion avec les accolad ne semble pas fonctionner pour les dossiers
    rm -${v}rf "$HOME/.oh-my-zsh" "$HOME/.vim" $HOME/.config/procps $HOME/.config/nvim
}


deploy()
{
    mkdir -${v}p $HOME/.config/procps
    ln -${v}s $ACTIVE_PATH/.vim $HOME/.vim && \
    ln -${v}s $ACTIVE_PATH/.vimrc $HOME/.vimrc && \
    ln -${v}s $ACTIVE_PATH/.screenrc $HOME/.screenrc && \
    ln -${v}s $ACTIVE_PATH/.gitignore_global $HOME/.gitignore_global && \
    ln -${v}s $ACTIVE_PATH/.gitconfig $HOME/.gitconfig && \
    ln -${v}s $ACTIVE_PATH/.alacritty.yml $HOME/.alacritty.yml && \
    ln -${v}s $ACTIVE_PATH/toprc $HOME/.config/procps/toprc && \
    ln -${v}s $ACTIVE_PATH/.bashrc $HOME/.bashrc && \
    ln -${v}s $ACTIVE_PATH/.zshrc $HOME/.zshrc
    ln -${v}s $ACTIVE_PATH/.zsh_bindkey $HOME/.zsh_bindkey
    ln -${v}s $PWD/nvim $HOME/.config/nvim
    ln -${v}s $PWD/.tmux.conf $HOME/.tmux.conf

    git submodule $([[ $verbose != 1 ]] && echo "--quiet") init $ACTIVE_PATH
    git submodule $([[ $verbose != 1 ]] && echo "--quiet") update $ACTIVE_PATH

	curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

	ln -${v}sn $ACTIVE_PATH/ohmyzsh $HOME/.oh-my-zsh
	cp  $([[ $verbose = 1 ]] && echo "-v") robbyrussell.zsh-theme-pi $HOME/.oh-my-zsh/themes/robbyrussell.zsh-theme

    [[ $verbose = 1 ]] && ruby -v || ruby -v > /dev/null
	if [ $? -eq 0 ]; then
	    cd $HOME/.vim/bundle/command-t/ruby/command-t/ext/command-t
        if [[ $verbose != 1 ]]; then
            ruby extconf.rb > /dev/null && make > /dev/null
        else
            ruby extconf.rb && make 
        fi
	    if [ $? -ne 0 ]; then
		    echo "Ruby compilation of command-t failed"
        fi
	else
		echo "Ruby isn't installed and command-t haven't been configured"
	fi
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
fi

clean
deploy

CUSTOMS_SCRIPT=$(find  $ACTIVE_PATH/custom.d/ -type f -name "*.bash");

if [ ! -z $CUSTOMS_SCRIPT ]; then
    for s in $CUSTOMS_SCRIPT; do
        source $s
    done
fi
