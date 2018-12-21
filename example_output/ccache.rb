name :
	 Ccache
homepage :
	 https://ccache.samba.org/
url :
	 https://www.samba.org/ftp/ccache/ccache-3.5.tar.xz
description :
	 Object-file caching compiler wrapper
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = etc/"xml/catalog" if build.head?
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make"
	 system "make", "install"
	 libexec.mkpath
	 %w[
	 clang
	 clang++
	 cc
	 gcc gcc2 gcc3 gcc-3.3 gcc-4.0 gcc-4.2 gcc-4.3 gcc-4.4 gcc-4.5 gcc-4.6 gcc-4.7 gcc-4.8 gcc-4.9 gcc-5 gcc-6 gcc-7
	 c++ c++3 c++-3.3 c++-4.0 c++-4.2 c++-4.3 c++-4.4 c++-4.5 c++-4.6 c++-4.7 c++-4.8 c++-4.9 c++-5 c++-6 c++-7
	 g++ g++2 g++3 g++-3.3 g++-4.0 g++-4.2 g++-4.3 g++-4.4 g++-4.5 g++-4.6 g++-4.7 g++-4.8 g++-4.9 g++-5 g++-6 g++-7
	 ].each do |prog|
	 libexec.install_symlink bin/"ccache" => prog
