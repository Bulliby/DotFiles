#!/bin/bash

check()
{
    if [ ! -f $(basename $0) ]; then
        echo "The current working directory must be the one of deploy.bash"
        exit $E_BADLOCATION
    fi

    if [ -z $HOME ]; then
        echo 'No environment variable $HOME'
        exit $E_MISSING_VAR
    fi

    if [ ! -d $TARGETS_FOLDER ]; then
        echo 'No "Targets" folder who contains targets.'
        exit $E_UNAVAILABLE_ENV
    fi

    if [ ! -d "$TARGETS_FOLDER/$target" ]; then
        echo "Your environment is not available"
        echo "You have choice between : $(ls -x $TARGETS_FOLDER | sed 's/  /,/g')"
        exit $E_UNAVAILABLE_ENV
    fi

    return 0
}
