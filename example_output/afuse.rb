name :
	 Afuse
homepage :
	 https://github.com/pcarrier/afuse/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/afuse/afuse-0.4.1.tar.gz
description :
	 Automounting file system implemented in userspace with FUSE
build_deps :
	 pkg-config
link_deps :
	 :osxfuse
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
