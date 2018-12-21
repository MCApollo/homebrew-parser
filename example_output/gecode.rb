name :
	 Gecode
homepage :
	 https://www.gecode.org/
url :
	 https://github.com/Gecode/gecode/archive/release-6.1.0.tar.gz
description :
	 Toolkit for developing constraint-based systems and applications
build_deps :
link_deps :
	 qt
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --prefix=#{prefix}
	 --disable-examples
	 ]
	 ENV.cxx11
	 if build.with? "qt"
	 args << "--enable-qt"
	 ENV.append_path "PKG_CONFIG_PATH", "#{HOMEBREW_PREFIX}/opt/qt/lib/pkgconfig"
	 else
	 args << "--disable-qt"
