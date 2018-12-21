name :
	 Pioneer
homepage :
	 https://pioneerspacesim.net/
url :
	 https://github.com/pioneerspacesim/pioneer/archive/20180203.tar.gz
description :
	 Game of lonely space adventure
build_deps :
	 autoconf
	 automake
	 pkg-config
link_deps :
	 assimp
	 freetype
	 libpng
	 libsigc++
	 libvorbis
	 sdl2
	 sdl2_image
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 ENV["PIONEER_DATA_DIR"] = "#{pkgshare}/data"
	 system "./bootstrap"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-version=#{version}"
	 system "make", "install"
