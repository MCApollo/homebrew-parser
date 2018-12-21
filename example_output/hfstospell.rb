name :
	 Hfstospell
homepage :
	 https://hfst.github.io/
url :
	 https://github.com/hfst/hfst-ospell/releases/download/v0.5.0/hfstospell-0.5.0.tar.gz
description :
	 Helsinki Finite-State Technology ospell
build_deps :
	 pkg-config
link_deps :
	 icu4c
	 libarchive
	 libxml++
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/674a62d/hfstospell/no-cxx17.diff
EOF_patch :
install :
	 ENV.append "CPPFLAGS", "-DU_USING_ICU_NAMESPACE=1"
	 ENV.cxx11
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}"
	 system "make", "install"
