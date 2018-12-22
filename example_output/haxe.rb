name :
	 Haxe
homepage :
	 https://haxe.org/
url :
	 https://github.com/HaxeFoundation/haxe.git
description :
	 Multi-platform programming language
build_deps :
	 camlp4
	 cmake
	 ocaml
link_deps :
	 neko
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 ENV["OCAMLPARAM"] = "safe-string=0,_"
	 ENV.deparallelize
	 if build.head?
	 Dir.mktmpdir("opamroot") do |opamroot|
	 ENV["OPAMROOT"] = opamroot
	 ENV["OPAMYES"] = "1"
	 system "opam", "init", "--no-setup"
	 system "opam", "config", "exec", "--",
	 "opam", "pin", "add", "haxe", buildpath, "--no-action"
	 system "opam", "config", "exec", "--",
	 "opam", "install", "haxe", "--deps-only"
	 system "opam", "config", "exec", "--",
	 "make", "ADD_REVISION=1"
	 end
	 else
	 system "make", "OCAMLOPT=ocamlopt.opt"
	 end
	 cd "extra/haxelib_src" do
	 system "cmake", "."
	 system "make"
	 end
	 rm "haxelib"
	 cp "extra/haxelib_src/haxelib", "haxelib"
	 bin.mkpath
	 system "make", "install", "INSTALL_BIN_DIR=#{bin}",
	 "INSTALL_LIB_DIR=#{lib}/haxe", "INSTALL_STD_DIR=#{lib}/haxe/std"
