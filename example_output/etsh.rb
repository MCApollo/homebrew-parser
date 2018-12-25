name :
	 Etsh
homepage :
	 https://etsh.io/
url :
	 https://etsh.io/src/etsh-5.2.0.tar.gz
description :
	 Two ports of /bin/sh from V6 UNIX (circa 1975)
build_deps :
link_deps :
optional_deps :
conflicts :
	 teleport
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure"
	 system "make", "install", "PREFIX=#{prefix}", "SYSCONFDIR=#{etc}", "MANDIR=#{man1}"
	 bin.install_symlink "etsh" => "osh"
	 bin.install_symlink "tsh" => "sh6"
