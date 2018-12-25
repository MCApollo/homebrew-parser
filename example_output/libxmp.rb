name :
	 Libxmp
homepage :
	 https://xmp.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/xmp/libxmp/4.4.1/libxmp-4.4.1.tar.gz
description :
	 C library for playback of module music (MOD, S3M, IT, etc)
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['demo_mods']
	 ['https://files.scene.org/get:us-http/mirrors/modsoulbrother/vim/vim-best-of.zip']
patches :
EOF_patch :
install :
	 system "autoconf" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
	 pkgshare.install resource("demo_mods")
