name :
	 Dwm
homepage :
	 https://dwm.suckless.org/
url :
	 https://dl.suckless.org/dwm/dwm-6.1.tar.gz
description :
	 Dynamic window manager
build_deps :
link_deps :
	 :x11
optional_deps :
	 dmenu
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "config.def.h",
	 "{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },",
	 "{ MODKEY|ControlMask,           XK_q,      quit,           {0} },"
	 inreplace "dwm.1", '.B Mod1\-Shift\-q', '.B Mod1\-Control\-q'
	 system "make", "PREFIX=#{prefix}", "install"
