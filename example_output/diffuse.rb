name :
	 Diffuse
homepage :
	 https://diffuse.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/diffuse/diffuse/0.4.8/diffuse-0.4.8.tar.bz2
description :
	 Graphical tool for merging and comparing text files
build_deps :
link_deps :
	 pygtk
conflicts :
patches :
EOF_patch :
install :
	 system "python", "./install.py",
	 "--sysconfdir=#{etc}",
	 "--examplesdir=#{share}",
	 "--prefix=#{prefix}"
	 inreplace bin/"diffuse", %r{^#!/usr/bin/env python$}, "#!/usr/bin/python"
