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
conflicts :
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
