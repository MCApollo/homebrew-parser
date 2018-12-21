name :
	 Gabedit
homepage :
	 https://gabedit.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/gabedit/gabedit/Gabedit250/GabeditSrc250.tar.gz
description :
	 GUI to computational chemistry packages like Gamess-US, Gaussian, etc.
build_deps :
	 pkg-config
link_deps :
	 gtk+
	 gtkglext
conflicts :
patches :
EOF_patch :
install :
	 opengl_headers = MacOS.sdk_path/"System/Library/Frameworks/OpenGL.framework/Headers"
	 (buildpath/"brew_include").install_symlink opengl_headers => "GL"
	 inreplace "CONFIG" do |s|
	 s.gsub! "-lX11", ""
	 s.gsub! "-lpangox-1.0", ""
	 s.gsub! "GTKCFLAGS =", "GTKCFLAGS = -I#{buildpath}/brew_include"
