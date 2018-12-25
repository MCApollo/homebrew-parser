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
optional_deps :
conflicts :
resource :
	 ['curl']
	 ['https://curl.haxx.se/download/curl-7.62.0.tar.bz2']
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
	 end
	 system "make", "prefix=#{prefix}", "install"
	 system "make", "-C", "man", "man"
	 man1.install "man/git-ftp.1"
	 (libexec/"bin").install bin/"git-ftp"
	 (bin/"git-ftp").write_env_script(libexec/"bin/git-ftp", :PATH => "#{libexec}/bin:$PATH")
