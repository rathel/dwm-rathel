#!/usr/bin/env bash
set -euo pipefail

D=$(pwd)
DWM=$D/dwm-flexipatch
SLOCK=$D/slock-flexipatch
ST=$D/st-flexipatch
DWMBLOCKS=$D/dwmblocks
DMENU=$D/dmenu-flexipatch
DWMSCRIPTS=$D/dwm-scripts
TABBED=$D/tabbed-flexipatch

if [ "$(hostname)" == "debian-asusrog" ]; then
	cd $DWMBLOCKS
	cp -vf blocks.def.h-asusrog blocks.def.h
else
	cd $DWMBLOCKS
	cp -vf blocks.def.h-default blocks.def.h
fi

DIRECTORIES=("$DWM"
	"$DWMBLOCKS"
	"$DMENU"
	"$SLOCK"
	"$ST"
	"$TABBED")

FILESTOREMOVE=("blocks.h"
	"patches.h"
	"config.h")

if ! [ "$(command -v unzip)" ]; then
	echo "Needs unzip"
	exit 1
fi
if ! [ "$(find /usr/include/X11 -iname "xft.h")" ]; then
	echo "Needs libXft"
	exit 1
fi
if ! [ "$(find /usr/include/X11 -iname "xinerama.h")" ]; then
	echo "Needs libXinerama"
	exit 1
fi
if ! [ "$(find /usr/include/X11 -iname "xrandr.h")" ]; then
	echo "Needs libXrandr"
	exit 1
fi

if ! [ "$(command -v kitty)" ]; then
	echo "Needs Kitty Terminal"
	exit 1
fi
if ! [ "$(command -v dunst)" ]; then
	echo "Needs dunst"
	exit 1
fi

BUILD() {
	echo "Running make..."
	echo ""
	make
	echo ""
	echo "Running make clean install..."
	echo ""
	sudo make clean install
}
REMOVEFILES() {
	set +eou pipefail
	for files in "${FILESTOREMOVE[@]}"; do
		rm -v $files
	done
	set -eou pipefail

}

#REPLACE(){
#        for x in $(ls *.TMP);do
#            echo "Replacing Variables in $x"
#            sed "s#{{HOME}}#$HOME#g" $x > "$(basename $x .TMP)"
#        done
#}

for bdir in "${DIRECTORIES[@]}"; do
	cd $bdir
	REMOVEFILES
	#    REPLACE
	BUILD
done

if [ ! -d $HOME/.local/share/dwm ]; then
	echo ""
	echo "Making Script Folder..."
	mkdir -p $HOME/.local/share/dwm
	echo ""
	echo "Copying Scripts..."
	cp -vf $DWMSCRIPTS/* $HOME/.local/share/dwm/
else
	echo ""
	echo "Copying Scripts..."
	cp -v $DWMSCRIPTS/* $HOME/.local/share/dwm/
fi

if [ ! -d /usr/share/xsessions ]; then
	sudo mkdir -p /usr/share/xsessions
	echo "Copying desktop file..."
	sudo cp -vf $D/dwm.desktop /usr/share/xsessions/dwm.desktop
elif [ ! -f /usr/share/xsessions/dwm.desktop ]; then
	sudo cp -vf $D/dwm.desktop /usr/share/xsessions/dwm.desktop
fi

if [ ! -d $HOME/.config/kitty ]; then
	echo "Making Kitty Folder..."
	mkdir -p $HOME/.config/kitty
	echo "Copying Kitty config..."
	cp -vf $D/kitty.conf $HOME/.config/kitty/
else
	echo "Copying Kitty config..."
	cp -vf $D/kitty.conf $HOME/.config/kitty/
fi

if [[ $(fc-list) != *Jet* ]]; then
	wget -c https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip -O /tmp/JetBrainsMono.zip
	unzip /tmp/JetBrainsMono.zip -d $HOME/.fonts
	fc-cache
fi

echo ""

cd $DWMBLOCKS
cp blocks.def.h-default blocks.def.h

echo "Done..."
exit 0
