name :
	 Leptonica
homepage :
	 http://www.leptonica.org/
url :
	 https://github.com/DanBloomberg/leptonica/releases/download/1.77.0/leptonica-1.77.0.tar.gz
description :
	 Image processing and image analysis library
build_deps :
	 pkg-config
link_deps :
	 jpeg
	 libpng
	 libtiff
optional_deps :
	 giflib
	 openjpeg
	 webp
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 ]
	 %w[libpng jpeg libtiff giflib].each do |dep|
	 args << "--without-#{dep}" if build.without?(dep)
	 end
	 %w[openjpeg webp].each do |dep|
	 args << "--with-lib#{dep}" if build.with?(dep)
	 args << "--without-lib#{dep}" if build.without?(dep)
	 end
	 system "./configure", *args
	 system "make", "install"
