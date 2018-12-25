name :
	 PkgConfig
homepage :
	 https://freedesktop.org/wiki/Software/pkg-config/
url :
	 https://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
description :
	 Manage compile and link flags for libraries
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 pc_path = %W[
	 #{HOMEBREW_PREFIX}/lib/pkgconfig
	 #{HOMEBREW_PREFIX}/share/pkgconfig
	 /usr/local/lib/pkgconfig
	 /usr/lib/pkgconfig
	 #{HOMEBREW_LIBRARY}/Homebrew/os/mac/pkgconfig/#{MacOS.version}
	 ].uniq.join(File::PATH_SEPARATOR)
	 system "./configure", "--disable-debug",
	 "--prefix=#{prefix}",
	 "--disable-host-tool",
	 "--with-internal-glib",
	 "--with-pc-path=#{pc_path}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
