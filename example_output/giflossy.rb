name :
	 Giflossy
homepage :
	 https://pornel.net/lossygif
url :
	 https://github.com/kornelski/giflossy/archive/1.91.tar.gz
description :
	 Lossy LZW compression, reduces GIF file sizes by 30-50%
build_deps :
	 autoconf
	 automake
link_deps :
optional_deps :
conflicts :
	 gifsicle
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --disable-gifview
	 ]
	 system "autoreconf", "-fvi"
	 system "./configure", *args
	 system "make", "install"
