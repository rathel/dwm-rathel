//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{"", "/home/rathel/.local/share/dwm/updates.sh", 60, 0},
	// {"", "/home/rathel/Devel/Ruby/phrases/main.rb", 30, 0},
	// {"", "/home/rathel/.local/share/dwm/bandwidth.sh", 1600, 0},
	{" ", "uname -r", 3600, 0},
	{"", "/home/rathel/.local/share/dwm/weather.sh", 3600, 0},
	{"", "/home/rathel/.local/share/dwm/touchpad.sh", 10, 0},
	// {"", "/home/rathel/.local/share/dwm/wifi.sh", 30, 0},
	{"", "/home/rathel/.local/share/dwm/volume.sh", 30, 0},
	{"", "/home/rathel/.local/share/dwm/brightness.py", 30, 0},
	{"", "/home/rathel/.local/share/dwm/batt.sh", 30, 0},
	{"", "/home/rathel/.local/share/dwm/diskspace.sh",	60,		0},
	{" ", "free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g",	30,		0},

	{"", "date '+%b %d (%a) %R'",					5,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
