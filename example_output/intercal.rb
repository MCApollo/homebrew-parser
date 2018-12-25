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
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.head?
	 cd "buildaux" do
	 system "./regenerate-build-system.sh"
	 end
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 (etc/"intercal").install Dir["etc/*"]
	 pkgshare.install "pit"
