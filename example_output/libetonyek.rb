name :
	 Libetonyek
homepage :
	 https://wiki.documentfoundation.org/DLP/Libraries/libetonyek
url :
	 https://dev-www.libreoffice.org/src/libetonyek/libetonyek-0.1.8.tar.xz
description :
	 Interpret and import Apple Keynote presentations
build_deps :
	 boost
	 pkg-config
link_deps :
	 glm
	 librevenge
	 mdds
conflicts :
patches :
EOF_patch :
install :
	 resource("liblangtag").stage do
	 system "./configure", "--prefix=#{libexec}", "--enable-modules=no"
	 system "make"
	 system "make", "install"
