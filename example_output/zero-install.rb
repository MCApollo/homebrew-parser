name :
	 ZeroInstall
homepage :
	 https://0install.net/
url :
	 https://downloads.sourceforge.net/project/zero-install/0install/2.13/0install-2.13.tar.bz2
description :
	 Zero Install is a decentralised software installation system
build_deps :
	 camlp4
	 ocaml
	 ocamlbuild
	 opam
	 pkg-config
link_deps :
	 gnupg
optional_deps :
	 gtk+
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["OCAMLPARAM"] = "safe-string=0,_"
	 ENV.append_path "PATH", Formula["gnupg"].opt_bin
	 opamroot = buildpath/"opamroot"
	 ENV["OPAMROOT"] = opamroot
	 ENV["OPAMYES"] = "1"
	 system "opam", "init", "--no-setup"
	 modules = %w[
	 cppo
	 yojson
	 xmlm
	 ounit
	 lwt_react
	 ocurl
	 obus
	 sha
	 cppo_ocamlbuild
	 ]
	 modules << "lablgtk" << "lwt_glib" if build.with? "gtk+"
	 system "opam", "config", "exec", "opam", "install", *modules
	 ENV.deparallelize { system "opam", "config", "exec", "make" }
	 inreplace "dist/install.sh" do |s|
	 s.gsub! '"/usr/local"', prefix
	 s.gsub! '"${PREFIX}/man"', man
	 end
	 system "make", "install"
