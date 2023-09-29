#! /bin/bash

rm -rf $HOME/.config/i3/config
rm -rf $HOME/.config/i3status/config

ln -s $ACTIVE_PATH/i3/config $HOME/.config/i3/config
ln -s $ACTIVE_PATH/i3/i3status/config $HOME/.config/i3status/config

