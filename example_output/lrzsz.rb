name :
	 Lrzsz
homepage :
	 https://www.ohse.de/uwe/software/lrzsz.html
url :
	 https://www.ohse.de/uwe/releases/lrzsz-0.12.20.tar.gz
description :
	 Tools for zmodem/xmodem/ymodem file transfer
build_deps :
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/macports/macports-ports/2319730/comms/lrzsz/files/patch-man-lsz.diff
	 https://raw.githubusercontent.com/macports/macports-ports/2319730/comms/lrzsz/files/patch-po-Makefile.in.in.diff
	 https://raw.githubusercontent.com/macports/macports-ports/2319730/comms/lrzsz/files/patch-src-Makefile.in.diff
	 https://raw.githubusercontent.com/macports/macports-ports/ed7e89d/comms/lrzsz/files/patch-zglobal.h.diff
	 https://raw.githubusercontent.com/macports/macports-ports/2319730/comms/lrzsz/files/patch-CVE-2018-10195.diff
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--disable-nls"
	 system "make"
	 bin.install "src/lrz", "src/lsz"
	 system "make", "install"
	 bin.install_symlink "lrz" => "rz", "lsz" => "sz"
