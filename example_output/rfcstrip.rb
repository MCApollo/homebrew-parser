name :
	 Rfcstrip
homepage :
	 https://trac.tools.ietf.org/tools/rfcstrip/
url :
	 https://trac.tools.ietf.org/tools/rfcstrip/rfcstrip-1.03.tgz
description :
	 Strips headers and footers from RFCs and Internet-Drafts
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "rfcstrip"
	 doc.install %w[about todo]
