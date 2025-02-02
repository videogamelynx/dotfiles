#!/usr/bin/env bash

THEME="lofi"

killall polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# CONFIG_DIR=$(dirname $0)/themes/$THEME/config.ini
CONFIG_DIR=/home/guts/.config/polybar/themes/lofi/config.ini
polybar main -c $CONFIG_DIR &
polybar secondary -c $CONFIG_DIR &
