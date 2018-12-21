name :
	 Lablgtk
homepage :
	 http://lablgtk.forge.ocamlcore.org
url :
	 https://forge.ocamlcore.org/frs/download.php/1726/lablgtk-2.18.6.tar.gz
description :
	 Objective Caml interface to gtk+
build_deps :
	 camlp4
	 pkg-config
link_deps :
	 gtk+
	 gtksourceview
	 librsvg
	 ocaml
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--bindir=#{bin}",
	 "--libdir=#{lib}",
	 "--mandir=#{man}",
	 "--with-libdir=#{lib}/ocaml"
	 ENV.deparallelize
	 system "make", "world"
	 system "make", "old-install"
