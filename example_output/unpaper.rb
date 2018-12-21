name :
	 Unpaper
homepage :
	 https://www.flameeyes.eu/projects/unpaper
url :
	 https://www.flameeyes.eu/files/unpaper-6.1.tar.xz
description :
	 Post-processing for scanned/photocopied books
build_deps :
	 pkg-config
link_deps :
	 ffmpeg
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-i" if build.head?
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
