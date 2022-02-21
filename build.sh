#!/usr/bin/env bash
set -e

D=$(pwd)
DWM=$D/dwm-flexipatch
ST=$D/st-flexipatch
DWMBLOCKS=$D/dwmblocks
DWMSCRIPTS=$D/dwm-scripts

DIRECTORIES=( "$DWM" "$ST" "$DWMBLOCKS" )

build(){
    if [ ! make ];then
        echo "ERORR"
        exit 1
    else
        echo "Running make..."
        echo ""
        make
        echo ""
        echo "Running make clean install..."
        echo ""
        sudo make clean install
    fi
}

for bdir in "${DIRECTORIES[@]}";do
    cd $bdir
    build
done

if [ ! -d $HOME/.local/share/dwm ];then
    echo ""
    echo "Making Script Folder..."
    mkdir -p $HOME/.local/share/dwm
    echo ""
    echo "Copying Scripts..."
    cp -vf $DWMSCRIPTS/* $HOME/.local/share/dwm/
else
    echo ""
    echo "Copying Scripts..."
    cp -vf $DWMSCRIPTS/* $HOME/.local/share/dwm/
fi

if [ ! -f /usr/share/xsessions/dwm.desktop ];then
    echo "Copying desktop file..."
    sudo cp -vf $D/dwm.desktop /usr/share/xsessions/dwm.desktop
fi

if [ ! -d $HOME/.config/kitty ];then
    echo "Making Kitty Folder..."
    mkdir -p $HOME/.config/kitty
    echo "Copying Kitty config..."
    cp -vf $D/kitty.conf $HOME/.config/kitty/
else
    echo "Copying Kitty config..."
    cp -vf $D/kitty.conf $HOME/.config/kitty/
fi

echo ""
echo "Done..."
exit 0
