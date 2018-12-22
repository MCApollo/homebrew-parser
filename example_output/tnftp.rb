name :
	 Tnftp
homepage :
	 https://opensource.apple.com/
url :
	 https://opensource.apple.com/tarballs/lukemftp/lukemftp-16.tar.gz
description :
	 NetBSD's FTP client (built from macOS Sierra sources)
build_deps :
	 :xcode
link_deps :
conflicts :
	 inetutils
patches :
EOF_patch :
install :
	 cd "tnftp" do
	 system "./configure"
	 system "make", "all"
	 system "strip", "-x", "src/ftp"
	 bin.install "src/ftp"
	 man1.install "src/ftp.1"
	 prefix.install_metafiles
	 end
