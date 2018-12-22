name :
	 Libidn2
homepage :
	 https://www.gnu.org/software/libidn/#libidn2
url :
	 https://ftp.gnu.org/gnu/libidn/libidn2-2.0.5.tar.gz
description :
	 International domain name library (IDNA2008, Punycode and TR46)
build_deps :
	 pkg-config
link_deps :
	 gettext
	 libunistring
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 ENV["GEM_HOME"] = buildpath/"gem_home"
	 system "gem", "install", "ronn"
	 ENV.prepend_path "PATH", buildpath/"gem_home/bin"
	 system "./bootstrap"
	 end
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--with-libintl-prefix=#{Formula["gettext"].opt_prefix}",
	 "--with-packager=Homebrew"
	 system "make", "install"
