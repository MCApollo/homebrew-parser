name :
	 Mu
homepage :
	 https://www.djcbsoftware.nl/code/mu/
url :
	 https://github.com/djcb/mu/releases/download/v1.0/mu-1.0.tar.xz
description :
	 Tool for searching e-mail messages stored in the maildir-format
build_deps :
	 autoconf
	 automake
	 libgpg-error
	 libtool
	 pkg-config
link_deps :
	 gettext
	 glib
	 xapian
	 emacs
conflicts :
patches :
EOF_patch :
install :
	 resource("gmime").stage do
	 system "./configure", "--prefix=#{prefix}/gmime", "--disable-introspection"
	 system "make", "install"
	 ENV.append_path "PKG_CONFIG_PATH", "#{prefix}/gmime/lib/pkgconfig"
	 end
	 ENV["EMACS"] = "no" if build.without? "emacs"
	 system "autoreconf", "-ivf"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--with-lispdir=#{elisp}"
	 system "make"
	 system "make", "install"
