name :
	 Healpix
homepage :
	 https://healpix.jpl.nasa.gov
url :
	 https://downloads.sourceforge.net/project/healpix/Healpix_3.50/Healpix_3.50_2018Dec10.tar.gz
description :
	 Hierarchical Equal Area isoLatitude Pixelization of a sphere
build_deps :
	 autoconf
	 automake
	 libtool
	 pkg-config
link_deps :
	 cfitsio
conflicts :
patches :
EOF_patch :
install :
	 configure_args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 ]
	 cd "src/C/autotools" do
	 system "autoreconf", "--install"
	 system "./configure", *configure_args
	 system "make", "install"
