name :
	 Intercal
homepage :
	 http://catb.org/~esr/intercal/
url :
	 http://catb.org/~esr/intercal/intercal-0.30.tar.gz
description :
	 Esoteric, parody programming language
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 cd "buildaux" do
	 system "./regenerate-build-system.sh"
	 end