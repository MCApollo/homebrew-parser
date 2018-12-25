name :
	 Hyperkit
homepage :
	 https://github.com/moby/hyperkit
url :
	 https://github.com/moby/hyperkit/archive/v0.20180403.tar.gz
description :
	 Toolkit for embedding hypervisor capabilities in your application
build_deps :
	 aspcud
	 ocaml
	 opam
link_deps :
	 :xcode
	 libev
optional_deps :
conflicts :
resource :
	 ['tinycorelinux']
	 ['https://dl.bintray.com/markeissler/homebrew/hyperkit-kernel/tinycorelinux_8.x.tar.gz']
patches :
EOF_patch :
install :
	 system "opam", "init", "--no-setup"
	 opam_dir = "#{buildpath}/.brew_home/.opam"
	 ENV["CAML_LD_LIBRARY_PATH"] = "#{opam_dir}/system/lib/stublibs:#{Formula["ocaml"].opt_lib}/ocaml/stublibs"
	 ENV["OPAMUTF8MSGS"] = "1"
	 ENV["PERL5LIB"] = "#{opam_dir}/system/lib/perl5"
	 ENV["OCAML_TOPLEVEL_PATH"] = "#{opam_dir}/system/lib/toplevel"
	 ENV.prepend_path "PATH", "#{opam_dir}/system/bin"
	 inreplace "#{opam_dir}/compilers/4.05.0/4.05.0/4.05.0.comp",
	 '["./configure"', '["./configure" "-no-graph"'
	 ENV.deparallelize { system "opam", "switch", "4.05.0" }
	 system "opam", "config", "exec", "--",
	 "opam", "install", "-y", "uri", "qcow", "conduit.1.0.0", "lwt.3.1.0",
	 "qcow-tool", "mirage-block-unix.2.9.0", "conf-libev", "logs", "fmt",
	 "mirage-unix", "prometheus-app"
	 args = []
	 args << "GIT_VERSION=#{version}"
	 system "opam", "config", "exec", "--", "make", *args
	 bin.install "build/hyperkit"
	 man1.install "hyperkit.1"
