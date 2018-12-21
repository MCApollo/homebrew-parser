name :
	 GitFtp
homepage :
	 https://git-ftp.github.io/
url :
	 https://github.com/git-ftp/git-ftp/archive/1.5.1.tar.gz
description :
	 Git-powered FTP client
build_deps :
	 pandoc
link_deps :
	 libssh2
conflicts :
patches :
EOF_patch :
install :
	 resource("curl").stage do
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{libexec}",
	 "--disable-ares",
	 "--with-darwinssl",
	 "--with-libssh2",
	 "--without-brotli",
	 "--without-ca-bundle",
	 "--without-ca-path",
	 "--without-gssapi",
	 "--without-libmetalink",
	 "--without-librtmp"
	 system "make", "install"
