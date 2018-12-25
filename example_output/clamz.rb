name :
	 Clamz
homepage :
	 https://code.google.com/archive/p/clamz/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/clamz/clamz-0.5.tar.gz
description :
	 Download MP3 files from Amazon's music store
build_deps :
	 pkg-config
link_deps :
	 libgcrypt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
