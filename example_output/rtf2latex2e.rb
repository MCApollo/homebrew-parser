name :
	 Rtf2latex2e
homepage :
	 https://rtf2latex2e.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/rtf2latex2e/rtf2latex2e-unix/2-2/rtf2latex2e-2-2-3.tar.gz
description :
	 RTF-to-LaTeX translation
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "install", "prefix=#{prefix}", "CC=#{ENV.cc}"
