name :
	 Povray
homepage :
	 https://www.povray.org/
url :
	 https://github.com/POV-Ray/povray/archive/v3.7.0.8.tar.gz
description :
	 Persistence Of Vision RAYtracer (POVRAY)
build_deps :
	 autoconf
	 automake
link_deps :
	 boost
	 jpeg
	 libpng
	 libtiff
	 :macos
	 openexr
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 args = %W[
	 COMPILED_BY=homebrew
	 --disable-debug
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --mandir=#{man}
	 --with-boost=#{Formula["boost"].opt_prefix}
	 --with-openexr=#{Formula["openexr"].opt_prefix}
	 --without-libsdl
	 --without-x
	 ]
	 %w[allanim allscene portfolio].each do |script|
	 inreplace "unix/scripts/#{script}.sh",
	 /^DEFAULT_DIR=.*$/, "DEFAULT_DIR=#{HOMEBREW_PREFIX}"
	 end
	 cd "unix" do
	 system "./prebuild.sh"
	 end
	 system "./configure", *args
	 system "make", "install"
