name :
	 Corectl
homepage :
	 https://github.com/TheNewNormal/corectl
url :
	 https://github.com/TheNewNormal/corectl/archive/v0.7.18.tar.gz
description :
	 CoreOS over macOS made very simple
build_deps :
	 aspcud
	 go
	 ocaml
	 opam
link_deps :
	 libev
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 path = buildpath/"src/github.com/TheNewNormal/#{name}"
	 path.install Dir["*"]
	 opamroot = path/"opamroot"
	 opamroot.mkpath
	 ENV["OPAMROOT"] = opamroot
	 ENV["OPAMYES"] = "1"
	 args = []
	 args << "VERSION=#{version}" if build.stable?
	 cd path do
	 system "opam", "init", "--no-setup"
	 inreplace "opamroot/compilers/4.04.2/4.04.2/4.04.2.comp",
	 '["./configure"', '["./configure" "-no-graph"'
	 system "opam", "switch", "4.04.2"
	 system "opam", "config", "exec", "--", "opam", "install", "uri",
	 "ocamlfind", "qcow-format", "conf-libev", "io-page<2",
	 "mirage-block-unix>2.3.0", "lwt<3.1.0"
	 (opamroot/"system/bin").install_symlink opamroot/"4.04.2/bin/qcow-tool"
	 system "opam", "config", "exec", "--", "make", "tarball", *args
	 bin.install Dir["bin/*"]
	 prefix.install_metafiles
	 man1.install Dir["documentation/man/*.1"]
	 pkgshare.install "examples"
	 end
