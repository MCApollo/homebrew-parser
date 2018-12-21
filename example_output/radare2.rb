name :
	 Radare2
homepage :
	 https://radare.org
url :
	 https://radare.mikelloc.com/get/2.8.0/radare2-2.8.0.tar.gz
description :
	 Reverse engineering framework
build_deps :
	 gobject-introspection
	 pkg-config
	 swig
	 valabind
link_deps :
	 :codesign
	 gmp
	 jansson
	 libewf
	 libmagic
	 lua
	 openssl
	 yara
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--with-openssl"
	 system "make", "CS_PATCHES=0"
	 if build.with? "code-signing"
	 home = `eval printf "~$USER"`
	 system "make", "HOME=#{home}", "-C", "binr/radare2", "macossign"
	 system "make", "HOME=#{home}", "-C", "binr/radare2", "macos-sign-libs"
