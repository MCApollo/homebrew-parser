name :
	 Star
homepage :
	 https://cdrtools.sourceforge.io/private/star.html
url :
	 https://downloads.sourceforge.net/project/s-tar/star-1.5.3.tar.bz2
description :
	 Standard tap archiver
build_deps :
	 smake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "smake", "GMAKE_NOWARN=true", "INS_BASE=#{prefix}", "INS_RBASE=#{prefix}", "install"
	 (bin+"gnutar").unlink
	 (bin+"tar").unlink
	 (man1+"gnutar.1").unlink
	 lib.rmtree
	 include.rmtree
	 %w[makefiles makerules].each { |f| (man5/"#{f}.5").unlink }
