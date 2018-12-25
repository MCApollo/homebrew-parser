name :
	 Rsnapshot
homepage :
	 https://www.rsnapshot.org/
url :
	 https://github.com/rsnapshot/rsnapshot/releases/download/1.4.2/rsnapshot-1.4.2.tar.gz
description :
	 File system snapshot utility (based on rsync)
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
