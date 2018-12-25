name :
	 Qjackctl
homepage :
	 https://qjackctl.sourceforge.io/
url :
	 https://downloads.sourceforge.net/qjackctl/qjackctl-0.5.3.tar.gz
description :
	 Simple Qt application to control the JACK sound server daemon
build_deps :
	 pkg-config
link_deps :
	 jack
	 qt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-debug",
	 "--disable-dbus",
	 "--disable-portaudio",
	 "--disable-xunique",
	 "--prefix=#{prefix}",
	 "--with-jack=#{Formula["jack"].opt_prefix}",
	 "--with-qt5=#{Formula["qt"].opt_prefix}"
	 system "make", "install"
	 prefix.install bin/"qjackctl.app"
	 bin.install_symlink prefix/"qjackctl.app/Contents/MacOS/qjackctl"
