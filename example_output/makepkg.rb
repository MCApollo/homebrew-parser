name :
	 Makepkg
homepage :
	 https://wiki.archlinux.org/index.php/makepkg
url :
	 https://projects.archlinux.org/git/pacman.git
description :
	 Compile and build packages suitable for installation with pacman
build_deps :
	 asciidoc
	 autoconf
	 automake
	 docbook-xsl
	 libtool
	 pkg-config
link_deps :
	 bash
	 fakeroot
	 gettext
	 libarchive
	 :macos
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = etc/"xml/catalog"
	 system "./autogen.sh"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--sysconfdir=#{etc}",
	 "--localstatedir=#{var}"
	 system "make", "install"
