name :
	 Glui
homepage :
	 https://glui.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/glui/Source/2.36/glui-2.36.tgz
description :
	 C++ user interface library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/src/include/GL/glui.h b/src/include/GL/glui.h
	 index 01a5c75..5784e29 100644
	 --- a/src/include/GL/glui.h
	 +++ b/src/include/GL/glui.h
	 @@ -941,7 +941,7 @@ public:
	 spacebar_mouse_click = true;    /* Does spacebar simulate a mouse click? */
	 live_type      = GLUI_LIVE_NONE;
	 text = "";
	 -        last_live_text == "";
	 +        last_live_text = "";
	 live_inited    = false;
	 collapsible    = false;
	 is_open        = true;
install :
	 cd "src" do
	 system "make", "setup"
	 system "make", "lib/libglui.a"
	 lib.install "lib/libglui.a"
	 include.install "include/GL"
	 end
