name :
	 S3fs
homepage :
	 https://github.com/s3fs-fuse/s3fs-fuse/wiki
url :
	 https://github.com/s3fs-fuse/s3fs-fuse/archive/v1.84.tar.gz
description :
	 FUSE-based file system backed by Amazon S3
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
	 gnutls
	 libgcrypt
	 nettle
	 :osxfuse
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking", "--with-gnutls", "--prefix=#{prefix}"
	 system "make", "install"
