name :
	 Mmv
homepage :
	 https://packages.debian.org/unstable/utils/mmv
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/m/mmv/mmv_1.01b.orig.tar.gz
description :
	 Move, copy, append, and link multiple files
build_deps :
link_deps :
conflicts :
patches :
	 https://mirrorservice.org/sites/ftp.debian.org/debian/pool/main/m/mmv/mmv_1.01b-15.diff.gz
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}", "LDFLAGS="
	 bin.install "mmv"
	 man1.install "mmv.1"
	 %w[mcp mad mln].each do |mxx|
	 bin.install_symlink "mmv" => mxx
	 man1.install_symlink "mmv.1" => "#{mxx}.1"
