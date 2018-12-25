name :
	 StartupNotification
homepage :
	 https://www.freedesktop.org/wiki/Software/startup-notification/
url :
	 https://www.freedesktop.org/software/startup-notification/releases/startup-notification-0.12.tar.gz
description :
	 Reference implementation of startup notification protocol
build_deps :
	 pkg-config
link_deps :
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
