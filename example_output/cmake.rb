name :
	 Cmake
homepage :
	 https://www.cmake.org/
url :
	 https://github.com/Kitware/CMake/releases/download/v3.13.2/cmake-3.13.2.tar.gz
description :
	 Cross-platform make
build_deps :
	 sphinx-doc
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11 if MacOS.version < :mavericks
	 ENV.append_to_cflags "-fpermissive" if MacOS.version <= :lion
	 args = %W[
	 --prefix=#{prefix}
	 --no-system-libs
	 --parallel=#{ENV.make_jobs}
	 --datadir=/share/cmake
	 --docdir=/share/doc/cmake
	 --mandir=/share/man
	 --sphinx-build=#{Formula["sphinx-doc"].opt_bin}/sphinx-build
	 --sphinx-html
	 --sphinx-man
	 --system-zlib
	 --system-bzip2
	 --system-curl
	 ]
	 ENV["LC_ALL"] = "en_US.UTF-8"
	 system "./bootstrap", *args, "--", "-DCMAKE_BUILD_TYPE=Release"
	 system "make"
	 system "make", "install"
	 elisp.install "Auxiliary/cmake-mode.el"
