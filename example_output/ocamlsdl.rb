name :
	 Ocamlsdl
homepage :
	 https://ocamlsdl.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/ocamlsdl/OCamlSDL/ocamlsdl-0.9.1/ocamlsdl-0.9.1.tar.gz
description :
	 OCaml interface with the SDL C library
build_deps :
link_deps :
	 ocaml
	 sdl
	 sdl_gfx
	 sdl_image
	 sdl_mixer
	 sdl_ttf
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["OCAMLPARAM"] = "safe-string=0,_"
	 system "./configure", "--prefix=#{prefix}",
	 "OCAMLLIB=#{lib}/ocaml"
	 system "make"
	 system "make", "install"
