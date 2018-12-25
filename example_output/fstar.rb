name :
	 Fstar
homepage :
	 https://www.fstar-lang.org/
url :
	 https://github.com/FStarLang/FStar.git
description :
	 ML-like language aimed at program verification
build_deps :
	 camlp4
	 ocamlbuild
	 opam
link_deps :
	 gmp
	 ocaml
optional_deps :
conflicts :
resource :
	 ['z3']
	 ['https://github.com/Z3Prover/z3.git']
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 ENV["OPAMROOT"] = buildpath/"opamroot"
	 ENV["OPAMYES"] = "1"
	 inreplace "src/ocaml-output/Makefile", "$(DATE_EXEC) -Iseconds",
	 "$(DATE_EXEC) '+%Y-%m-%dT%H:%M:%S%z'"
	 resource("z3").stage do
	 githash = Utils.popen_read("git", "rev-parse", "--short=12", "HEAD").chomp
	 system "python", "scripts/mk_make.py", "--prefix=#{libexec}",
	 "--githash=#{githash}"
	 cd "build" do
	 system "make"
	 system "make", "install"
	 end
	 end
	 system "opam", "init", "--no-setup"
	 system "opam", "config", "exec", "opam", "install",
	 "ocamlfind", "batteries", "stdint", "zarith", "yojson", "fileutils",
	 "pprint", "menhir", "ulex", "ppx_deriving", "ppx_deriving_yojson",
	 "process"
	 system "opam", "config", "exec", "--", "make", "-C", "src/ocaml-output"
	 (libexec/"bin").install "bin/fstar.exe"
	 (bin/"fstar.exe").write <<~EOS
	 #!/bin/sh
	 #{libexec}/bin/fstar.exe --smt #{libexec}/bin/z3 "$@"
	 EOS
	 (libexec/"ulib").install Dir["ulib/*"]
	 (libexec/"contrib").install Dir["ucontrib/*"]
	 (libexec/"examples").install Dir["examples/*"]
	 (libexec/"tutorial").install Dir["doc/tutorial/*"]
	 (libexec/"src").install Dir["src/*"]
	 prefix.install "LICENSE-fsharp.txt"
	 prefix.install_symlink libexec/"ulib"
	 prefix.install_symlink libexec/"contrib"
	 prefix.install_symlink libexec/"examples"
	 prefix.install_symlink libexec/"tutorial"
	 prefix.install_symlink libexec/"src"
