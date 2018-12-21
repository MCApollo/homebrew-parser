name :
	 QalculateGtk
homepage :
	 https://qalculate.github.io/
url :
	 https://github.com/Qalculate/qalculate-gtk/releases/download/v2.8.2/qalculate-gtk-2.8.2.tar.gz
description :
	 Multi-purpose desktop calculator
build_deps :
	 intltool
	 pkg-config
link_deps :
	 adwaita-icon-theme
	 gtk+3
	 libqalculate
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
