-- automatically generated file. Do not edit (see /usr/share/doc/menu/html)

module("debian.menu")

Debian_menu = {}

Debian_menu["Debian_Applications_Accessibility"] = {
	{"Dasher text entry","/usr/bin/dasher"},
	{"The GNOME Onscreen Keyboard","/usr/bin/gok"},
	{"Xmag","xmag"},
}
Debian_menu["Debian_Applications_Data_Management"] = {
	{"HSQLDB Database Manager","/usr/bin/hsqldb-databasemanager","/usr/share/pixmaps/hsqldb.xpm"},
	{"HSQLDB Database Manager (Swing)","/usr/bin/hsqldb-databasemanagerswing","/usr/share/pixmaps/hsqldb.xpm"},
	{"HSQLDB Query Tool","/usr/bin/hsqldb-querytool","/usr/share/pixmaps/hsqldb.xpm"},
	{"HSQLDB Transfer Tool","/usr/bin/hsqldb-transfer","/usr/share/pixmaps/hsqldb.xpm"},
	{"OpenOffice.org Base","/usr/bin/oobase","/usr/share/icons/gnome/32x32/apps/openofficeorg3-base.xpm"},
}
Debian_menu["Debian_Applications_Editors"] = {
	{"Gedit","/usr/bin/gedit","/usr/share/pixmaps/gedit-icon.xpm"},
	{"GVIM","/usr/bin/vim.gnome -g -f","/usr/share/pixmaps/vim-32.xpm"},
}
Debian_menu["Debian_Applications_File_Management"] = {
	{"Baobab","/usr/bin/baobab","/usr/share/pixmaps/baobab.xpm"},
	{"File-Roller","/usr/bin/file-roller","/usr/share/pixmaps/file-roller.xpm"},
	{"GNOME Search Tool","/usr/bin/gnome-search-tool","/usr/share/pixmaps/gsearchtool.xpm"},
	{"Unison 2.27.57 (GTK)","/usr/bin/unison-2.27.57-gtk","/usr/share/pixmaps/unison-gtk.xpm"},
}
Debian_menu["Debian_Applications_Graphics"] = {
	{"dotty","/usr/bin/dotty"},
	{"GNOME Screenshot Tool","/usr/bin/gnome-panel-screenshot"},
	{"ImageMagick","/usr/bin/display logo:"},
	{"lefty","/usr/bin/lefty"},
	{"OpenOffice.org Draw","/usr/bin/oodraw","/usr/share/icons/gnome/32x32/apps/openofficeorg3-draw.xpm"},
	{"Scribus (stable)","/usr/bin/scribus","/usr/share/pixmaps/scribus.xpm"},
	{"The GIMP","/usr/bin/gimp","/usr/share/pixmaps/gimp.xpm"},
	{"X Window Snapshot","xwd | xwud"},
}
Debian_menu["Debian_Applications_Mobile_Devices"] = {
	{"Wammu","/usr/bin/wammu","/usr/share/pixmaps/wammu.xpm"},
}
Debian_menu["Debian_Applications_Net_File_Transfer"] = {
	{"BitTorrent Download Client","/usr/bin/gnome-btdownload","/usr/share/pixmaps/download.svg"},
}
Debian_menu["Debian_Applications_Net"] = {
	{ "File Transfer", Debian_menu["Debian_Applications_Net_File_Transfer"] },
}
Debian_menu["Debian_Applications_Network_Communication"] = {
	{"Ekiga","/usr/bin/ekiga","/usr/share/pixmaps/ekiga.xpm"},
	{"Gajim","/usr/bin/gajim","/usr/share/pixmaps/gajim.xpm"},
	{"Mutt", "x-terminal-emulator -e ".."/usr/bin/mutt","/usr/share/pixmaps/mutt.xpm"},
	{"Pidgin","/usr/bin/pidgin","/usr/share/pixmaps/pidgin-menu.xpm"},
	{"QuteCom","/usr/bin/qutecom","/usr/share/pixmaps/qutecom.xpm"},
	{"Telnet", "x-terminal-emulator -e ".."/usr/bin/telnet"},
	{"Terminal Server Client","/usr/bin/tsclient -f","/usr/share/pixmaps/tsclient.xpm"},
	{"TwiTux","/usr/bin/twitux","/usr/share/pixmaps/twitux.xpm"},
	{"X Chat","/usr/bin/xchat","/usr/share/icons/xchat.xpm"},
	{"Xbiff","xbiff"},
}
Debian_menu["Debian_Applications_Network_Monitoring"] = {
	{"WiFi Radar","su-to-root -X -c /usr/sbin/wifi-radar","/usr/share/pixmaps/wifi-radar.xpm"},
	{"Wireshark","/usr/bin/wireshark","/usr/share/pixmaps/wsicon32.xpm"},
}
Debian_menu["Debian_Applications_Network_Web_Browsing"] = {
	{"Epiphany web browser (Gecko)","/usr/bin/epiphany-gecko"},
	{"Epiphany web browser (Webkit)","/usr/bin/epiphany-webkit"},
	{"Firefox 3.5 Browser","/usr/bin/firefox-3.5","/usr/share/pixmaps/firefox-3.5.png"},
	{"w3m", "x-terminal-emulator -e ".."/usr/bin/w3m /usr/share/doc/w3m/MANUAL.html"},
}
Debian_menu["Debian_Applications_Network"] = {
	{ "Communication", Debian_menu["Debian_Applications_Network_Communication"] },
	{"Manhole Twisted Client","/usr/bin/manhole"},
	{ "Monitoring", Debian_menu["Debian_Applications_Network_Monitoring"] },
	{"Twisted Application Generator","/usr/bin/tkmktap"},
	{"Twisted Instance Messenger","/usr/bin/im"},
	{"Twisted SSH Client","/usr/bin/tkconch"},
	{ "Web Browsing", Debian_menu["Debian_Applications_Network_Web_Browsing"] },
}
Debian_menu["Debian_Applications_Office"] = {
	{"AbiWord Word Processor","/usr/bin/abiword","/usr/share/pixmaps/abiword.xpm"},
	{"gnumeric","/usr/bin/gnumeric","/usr/share/pixmaps/gnome-gnumeric.xpm"},
	{"HPLIP Fax address book","/usr/bin/hp-fab","/usr/share/pixmaps/HPmenu.xpm"},
	{"HPLIP Fax utility","/usr/bin/hp-sendfax","/usr/share/pixmaps/HPmenu.xpm"},
	{"OpenOffice.org Calc","/usr/bin/oocalc","/usr/share/icons/gnome/32x32/apps/openofficeorg3-calc.xpm"},
	{"OpenOffice.org Impress","/usr/bin/ooimpress","/usr/share/icons/gnome/32x32/apps/openofficeorg3-impress.xpm"},
	{"OpenOffice.org Writer","/usr/bin/oowriter","/usr/share/icons/gnome/32x32/apps/openofficeorg3-writer.xpm"},
}
Debian_menu["Debian_Applications_Programming"] = {
	{"Data Display Debugger","/usr/bin/ddd"},
	{"Erlang Shell", "x-terminal-emulator -e ".."/usr/bin/erl","/usr/share/pixmaps/erlang.xpm"},
	{"Erlang Shell & Toolbar", "x-terminal-emulator -e ".."/usr/bin/erl -s toolbar","/usr/share/pixmaps/erlang.xpm"},
	{"GDB", "x-terminal-emulator -e ".."/usr/bin/gdb"},
	{"Meld","/usr/bin/meld"},
	{"Qt3 Assistant","/usr/bin/assistant-qt3"},
	{"Ruby (irb1.8)", "x-terminal-emulator -e ".."/usr/bin/irb1.8"},
	{"Tclsh8.4", "x-terminal-emulator -e ".."/usr/bin/tclsh8.4"},
	{"Tclsh8.5", "x-terminal-emulator -e ".."/usr/bin/tclsh8.5"},
	{"TkWish8.4","x-terminal-emulator -e /usr/bin/wish8.4"},
	{"TkWish8.5","x-terminal-emulator -e /usr/bin/wish8.5"},
}
Debian_menu["Debian_Applications_Science_Engineering"] = {
	{"QCad","/usr/bin/qcad","/usr/share/pixmaps/qcad.xpm"},
}
Debian_menu["Debian_Applications_Science_Mathematics"] = {
	{"Bc", "x-terminal-emulator -e ".."/usr/bin/bc"},
	{"Dc", "x-terminal-emulator -e ".."/usr/bin/dc"},
	{"GCalcTool","/usr/bin/gcalctool","/usr/share/pixmaps/gcalctool.xpm"},
	{"Gnuplot", "x-terminal-emulator -e ".."/usr/bin/gnuplot"},
	{"OpenOffice.org Math","/usr/bin/oomath","/usr/share/icons/gnome/32x32/apps/openofficeorg3-math.xpm"},
	{"Units", "x-terminal-emulator -e ".."units"},
	{"Xcalc","xcalc"},
}
Debian_menu["Debian_Applications_Science"] = {
	{ "Engineering", Debian_menu["Debian_Applications_Science_Engineering"] },
	{ "Mathematics", Debian_menu["Debian_Applications_Science_Mathematics"] },
}
Debian_menu["Debian_Applications_Shells"] = {
	{"Bash", "x-terminal-emulator -e ".."/bin/bash --login"},
	{"Dash", "x-terminal-emulator -e ".."/bin/dash -i"},
	{"Python (v2.4)", "x-terminal-emulator -e ".."/usr/bin/python2.4","/usr/share/pixmaps/python2.4.xpm"},
	{"Python (v2.5)", "x-terminal-emulator -e ".."/usr/bin/python2.5","/usr/share/pixmaps/python2.5.xpm"},
	{"Sh", "x-terminal-emulator -e ".."/bin/sh --login"},
	{"tcsh", "x-terminal-emulator -e ".."/bin/tcsh"},
}
Debian_menu["Debian_Applications_Sound"] = {
	{"glurp","/usr/bin/glurp"},
	{"gmix (Gnome 2.0 Mixer)","/usr/bin/gnome-volume-control","/usr/share/pixmaps/gnome-mixer.xpm"},
	{"grecord (GNOME 2.0 Recorder)","/usr/bin/gnome-sound-recorder","/usr/share/pixmaps/gnome-grecord.xpm"},
	{"padevchooser","/usr/bin/padevchooser"},
	{"paman","/usr/bin/paman"},
	{"paprefs","/usr/bin/paprefs"},
	{"pavucontrol","/usr/bin/pavucontrol"},
	{"pavumeter","/usr/bin/pavumeter"},
}
Debian_menu["Debian_Applications_System_Administration"] = {
	{"Aptitude", "x-terminal-emulator -e ".."/usr/bin/aptitude"},
	{"Debian Task selector", "x-terminal-emulator -e ".."su-to-root -c tasksel"},
	{"Editres","editres"},
	{"Foomatic printer configuration tool","su-to-root -X -c /usr/bin/foomatic-gui"},
	{"GNOME Network Tool","/usr/bin/gnome-nettool","/usr/share/pixmaps/gnome-nettool.xpm"},
	{"GNOME partition editor","su-to-root -X -c /usr/sbin/gparted","/usr/share/pixmaps/gparted.xpm"},
	{"HPLIP File printing","/usr/bin/hp-print","/usr/share/pixmaps/HPmenu.xpm"},
	{"nitrogen","/usr/bin/nitrogen"},
	{"OpenJDK Java 6 Policy Tool","/usr/lib/jvm/java-6-openjdk/bin/policytool","/usr/share/pixmaps/openjdk-6.xpm"},
	{"Orphaner (all)", "x-terminal-emulator -e ".."su-to-root -c '/usr/sbin/orphaner -a'"},
	{"Orphaner (libs)", "x-terminal-emulator -e ".."su-to-root -c /usr/sbin/orphaner"},
	{"Orphaner - editkeep", "x-terminal-emulator -e ".."su-to-root -c '/usr/sbin/editkeep'"},
	{"QtConfig","/usr/bin/qtconfig-qt4"},
	{"reportbug", "x-terminal-emulator -e ".."/usr/bin/reportbug --exit-prompt"},
	{"Services Admin","/usr/bin/services-admin","/usr/share/gnome-system-tools/pixmaps/services.xpm"},
	{"Shares Admin","/usr/bin/shares-admin","/usr/share/gnome-system-tools/pixmaps/shares.xpm"},
	{"System Information","/usr/bin/hardinfo","/usr/share/pixmaps/hardinfo.xpm"},
	{"TeXconfig", "x-terminal-emulator -e ".."/usr/bin/texconfig"},
	{"Time Admin","/usr/bin/time-admin","/usr/share/gnome-system-tools/pixmaps/time.xpm"},
	{"User accounts Admin","/usr/bin/users-admin","/usr/share/gnome-system-tools/pixmaps/users.xpm"},
	{"Xclipboard","xclipboard"},
	{"Xfontsel","xfontsel"},
	{"Xkill","xkill"},
	{"Xrefresh","xrefresh"},
}
Debian_menu["Debian_Applications_System_Hardware"] = {
	{"GNOME Floppy Formatter","/usr/bin/gfloppy","/usr/share/pixmaps/gfloppy.xpm"},
	{"gsynaptics","/usr/bin/gsynaptics"},
	{"HPLIP Toolbox","/usr/bin/hp-toolbox","/usr/share/pixmaps/HPmenu.xpm"},
	{"Xvidtune","xvidtune"},
}
Debian_menu["Debian_Applications_System_Monitoring"] = {
	{"GNOME Log Viewer","/usr/bin/gnome-system-log","/usr/share/pixmaps/gnome-system-log.xpm"},
	{"htop", "x-terminal-emulator -e ".."/usr/bin/htop"},
	{"Pstree", "x-terminal-emulator -e ".."/usr/bin/pstree.x11","/usr/share/pixmaps/pstree16.xpm"},
	{"Top", "x-terminal-emulator -e ".."/usr/bin/top"},
	{"Xconsole","xconsole -file /dev/xconsole"},
	{"Xev","x-terminal-emulator -e xev"},
	{"Xload","xload"},
}
Debian_menu["Debian_Applications_System_Package_Management"] = {
	{"Synaptic Package Manager","/usr/bin/su-to-root -X -c /usr/sbin/synaptic","/usr/share/synaptic/pixmaps/synaptic_32x32.xpm"},
}
Debian_menu["Debian_Applications_System_Security"] = {
	{"Seahorse","/usr/bin/seahorse","/usr/share/pixmaps/seahorse.xpm"},
}
Debian_menu["Debian_Applications_System"] = {
	{ "Administration", Debian_menu["Debian_Applications_System_Administration"] },
	{"GNOME system monitor","/usr/bin/gnome-system-monitor"},
	{ "Hardware", Debian_menu["Debian_Applications_System_Hardware"] },
	{ "Monitoring", Debian_menu["Debian_Applications_System_Monitoring"] },
	{ "Package Management", Debian_menu["Debian_Applications_System_Package_Management"] },
	{ "Security", Debian_menu["Debian_Applications_System_Security"] },
}
Debian_menu["Debian_Applications_Terminal_Emulators"] = {
	{"X-Terminal as root (GKsu)","/usr/bin/gksu -u root /usr/bin/x-terminal-emulator","/usr/share/pixmaps/gksu-debian.xpm"},
	{"XTerm","xterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
	{"XTerm (Unicode)","uxterm","/usr/share/pixmaps/xterm-color_32x32.xpm"},
}
Debian_menu["Debian_Applications_Text"] = {
	{"Character map","/usr/bin/gucharmap"},
	{"GNOME Dictionary","/usr/bin/gnome-dictionary","/usr/share/pixmaps/gdict.xpm"},
}
Debian_menu["Debian_Applications_Video"] = {
	{"totem (GStreamer)","/usr/bin/totem-gstreamer","/usr/share/pixmaps/totem.xpm"},
	{"totem (Xine)","/usr/bin/totem-xine","/usr/share/pixmaps/totem.xpm"},
}
Debian_menu["Debian_Applications_Viewers"] = {
	{"Epdfview","/usr/bin/epdfview","/usr/share/pixmaps/epdfview.xpm"},
	{"Evince","/usr/bin/evince","/usr/share/pixmaps/evince.xpm"},
	{"Eye of GNOME","/usr/bin/eog","/usr/share/pixmaps/gnome-eog.xpm"},
	{"gThumb Image Viewer","/usr/bin/gthumb","/usr/share/pixmaps/gthumb.xpm"},
	{"MPlayer","/usr/bin/gmplayer","/usr/share/pixmaps/mplayer.xpm"},
	{"VLC media player","/usr/bin/wxvlc","/usr/share/vlc/vlc.xpm"},
	{"Xditview","xditview"},
	{"XDvi","/usr/bin/xdvi"},
	{"Xpdf","/usr/bin/xpdf","/usr/share/pixmaps/xpdf.xpm"},
}
Debian_menu["Debian_Applications"] = {
	{ "Accessibility", Debian_menu["Debian_Applications_Accessibility"] },
	{ "Data Management", Debian_menu["Debian_Applications_Data_Management"] },
	{ "Editors", Debian_menu["Debian_Applications_Editors"] },
	{ "File Management", Debian_menu["Debian_Applications_File_Management"] },
	{ "Graphics", Debian_menu["Debian_Applications_Graphics"] },
	{ "Mobile Devices", Debian_menu["Debian_Applications_Mobile_Devices"] },
	{ "Net", Debian_menu["Debian_Applications_Net"] },
	{ "Network", Debian_menu["Debian_Applications_Network"] },
	{ "Office", Debian_menu["Debian_Applications_Office"] },
	{ "Programming", Debian_menu["Debian_Applications_Programming"] },
	{ "Science", Debian_menu["Debian_Applications_Science"] },
	{ "Shells", Debian_menu["Debian_Applications_Shells"] },
	{ "Sound", Debian_menu["Debian_Applications_Sound"] },
	{ "System", Debian_menu["Debian_Applications_System"] },
	{ "Terminal Emulators", Debian_menu["Debian_Applications_Terminal_Emulators"] },
	{ "Text", Debian_menu["Debian_Applications_Text"] },
	{ "Video", Debian_menu["Debian_Applications_Video"] },
	{ "Viewers", Debian_menu["Debian_Applications_Viewers"] },
}
Debian_menu["Debian_Games_Board"] = {
	{"GnuChess", "x-terminal-emulator -e ".."/usr/games/gnuchess"},
}
Debian_menu["Debian_Games_Toys"] = {
	{"Oclock","oclock"},
	{"Xclock (analog)","xclock -analog"},
	{"Xclock (digital)","xclock -digital -update 1"},
	{"Xeyes","xeyes"},
	{"Xlogo","xlogo"},
}
Debian_menu["Debian_Games"] = {
	{ "Board", Debian_menu["Debian_Games_Board"] },
	{ "Toys", Debian_menu["Debian_Games_Toys"] },
}
Debian_menu["Debian_Help"] = {
	{"Info", "x-terminal-emulator -e ".."info"},
	{"TeXdoctk","/usr/bin/texdoctk"},
	{"Xman","xman"},
	{"yelp","/usr/bin/yelp"},
}
Debian_menu["Debian"] = {
	{ "Applications", Debian_menu["Debian_Applications"] },
	{ "Games", Debian_menu["Debian_Games"] },
	{ "Help", Debian_menu["Debian_Help"] },
}
