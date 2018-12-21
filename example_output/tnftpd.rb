name :
	 Tnftpd
homepage :
	 https://opensource.apple.com/
url :
	 https://opensource.apple.com/tarballs/lukemftpd/lukemftpd-51.tar.gz
description :
	 NetBSD's FTP server (built from macOS Sierra sources)
build_deps :
	 :xcode
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "tar", "zxvf", "tnftpd-20100324.tar.gz"
	 cd "tnftpd-20100324" do
	 system "./configure"
	 system "make"
	 sbin.install "src/tnftpd" => "ftpd"
	 man8.install "src/tnftpd.man" => "ftpd.8"
	 man5.install "src/ftpusers.man" => "ftpusers.5"
	 man5.install "src/ftpd.conf.man" => "ftpd.conf.5"
	 etc.install "examples/ftpd.conf"
	 etc.install "examples/ftpusers"
	 prefix.install_metafiles
