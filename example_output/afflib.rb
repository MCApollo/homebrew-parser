name :
	 Afflib
homepage :
	 https://github.com/sshock/AFFLIBv3
url :
	 https://github.com/sshock/AFFLIBv3/archive/v3.7.17.tar.gz
description :
	 Advanced Forensic Format
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 openssl
	 python@2
optional_deps :
	 :osxfuse
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = ["--enable-s3", "--enable-python"]
	 if build.with? "osxfuse"
	 ENV.append "CPPFLAGS", "-I/usr/local/include/osxfuse"
	 ENV.append "LDFLAGS", "-L/usr/local/lib"
	 args << "--enable-fuse"
	 else
	 args << "--disable-fuse"
	 end
	 system "autoreconf", "-fiv"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 *args
	 system "make", "install"
