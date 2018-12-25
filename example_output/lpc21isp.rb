name :
	 Lpc21isp
homepage :
	 https://lpc21isp.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/lpc21isp/lpc21isp/1.97/lpc21isp_197.tar.gz
description :
	 In-circuit programming (ISP) tool for several NXP microcontrollers
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 bin.install ["lpc21isp"]
