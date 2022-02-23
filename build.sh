#!/usr/bin/env bash
set -e

D=$(pwd)
DWM=$D/dwm-flexipatch
SLOCK=$D/slock-flexipatch
#ST=$D/st-flexipatch
DWMBLOCKS=$D/dwmblocks
DWMSCRIPTS=$D/dwm-scripts

DIRECTORIES=( "$DWM" "$DWMBLOCKS" "$SLOCK" )

build(){
        echo "Running make..."
        echo ""
        make
        echo ""
        echo "Running make clean install..."
        echo ""
        sudo make clean install
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

if [ ! -d /usr/share/xsessions ];then
    mkdir -p /usr/share/xsessions
    echo "Copying desktop file..."
    sudo cp -vf $D/dwm.desktop /usr/share/xsessions/dwm.desktop
elif [ ! -f /usr/share/xsessions/dwm.desktop ];then
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

if [[ $(fc-list) != *Jet* ]];then
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip -O /tmp/JetBrainsMono.zip
    unzip /tmp/JetBrainsMono.zip -d $HOME/.fonts
    fc-cache
fi

echo ""
echo "Done..."
exit 0
