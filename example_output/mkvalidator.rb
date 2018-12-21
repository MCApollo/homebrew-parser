name :
	 Mkvalidator
homepage :
	 https://www.matroska.org/downloads/mkvalidator.html
url :
	 https://downloads.sourceforge.net/project/matroska/mkvalidator/mkvalidator-0.5.2.tar.bz2
description :
	 Tool to verify Matroska and WebM files for spec conformance
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 inreplace "configure", "\r", "\n"
	 system "./configure"
	 system "make", "-C", "mkvalidator"
	 bindir = `corec/tools/coremake/system_output.sh`.chomp
	 bin.install "release/#{bindir}/mkvalidator"
