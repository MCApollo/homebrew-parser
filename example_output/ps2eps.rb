name :
	 Ps2eps
homepage :
	 https://www.tm.uka.de/~bless/ps2eps
url :
	 https://www.tm.uka.de/~bless/ps2eps-1.68.tar.gz
description :
	 Convert PostScript to EPS files
build_deps :
link_deps :
	 ghostscript
conflicts :
patches :
EOF_patch :
install :
	 system ENV.cc, "src/C/bbox.c", "-o", "bbox"
	 bin.install "bbox"
	 (libexec/"bin").install "bin/ps2eps"
	 (bin/"ps2eps").write <<~EOS
	 #!/bin/sh
	 perl -S #{libexec}/bin/ps2eps \"$@\"
	 EOS
	 share.install "doc/man"
	 doc.install "doc/pdf", "doc/html"
