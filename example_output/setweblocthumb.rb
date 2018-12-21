name :
	 Setweblocthumb
homepage :
	 https://hasseg.org/setWeblocThumb/
url :
	 https://github.com/ali-rantakari/setWeblocThumb/archive/v1.0.0.tar.gz
description :
	 Assigns custom icons to webloc files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "setWeblocThumb"
