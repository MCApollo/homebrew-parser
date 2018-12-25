name :
	 Dcal
homepage :
	 https://alexeyt.freeshell.org/
url :
	 https://alexeyt.freeshell.org/code/dcal.c
description :
	 dcal(1) is to cal(1) what ddate(1) is to date(1)
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
	 system ENV.cxx, "dcal.c", "-o", "dcal"
	 bin.install "dcal"
