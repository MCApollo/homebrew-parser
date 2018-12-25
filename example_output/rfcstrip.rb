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
optional_deps :
conflicts :
resource :
	 ['rfc1149']
	 ['https://www.ietf.org/rfc/rfc1149.txt']
patches :
EOF_patch :
install :
	 bin.install "rfcstrip"
	 doc.install %w[about todo]
