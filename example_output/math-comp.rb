name :
	 MathComp
homepage :
	 https://math-comp.github.io/math-comp/
url :
	 https://github.com/math-comp/math-comp/archive/mathcomp-1.7.0.tar.gz
description :
	 Mathematical Components for the Coq proof assistant
build_deps :
	 ocaml
link_deps :
	 coq
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 coqlib = "#{lib}/coq/"
	 (buildpath/"mathcomp/Makefile.coq.local").write <<~EOS
	 COQLIB=#{coqlib}
	 EOS
	 cd "mathcomp" do
	 system "make", "Makefile.coq"
	 system "make", "-f", "Makefile.coq", "MAKEFLAGS=#{ENV["MAKEFLAGS"]}"
	 system "make", "install", "MAKEFLAGS=#{ENV["MAKEFLAGS"]}"
	 elisp.install "ssreflect/pg-ssr.el"
	 end
	 doc.install Dir["docs/*"]
