name :
	 S3Backer
homepage :
	 https://github.com/archiecobbs/s3backer
url :
	 https://s3.amazonaws.com/archie-public/s3backer/s3backer-1.5.0.tar.gz
description :
	 FUSE-based single file backing store via Amazon S3
build_deps :
	 pkg-config
link_deps :
	 openssl
	 :osxfuse
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "configure", "-lfuse", "-losxfuse"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
