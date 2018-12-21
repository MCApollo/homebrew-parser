name :
	 Sdf
homepage :
	 https://strategoxt.org/Sdf/WebHome
url :
	 http://www.meta-environment.org/releases/sdf-2.6.3.tar.gz
description :
	 Syntax Definition Formalism: high-level description of grammars
build_deps :
	 pkg-config
link_deps :
	 aterm
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 ENV.append "CFLAGS", "-std=gnu89 -fbracket-depth=1024" if ENV.compiler == :clang
	 resource("c-library").stage do
	 system "./configure", "--prefix=#{libexec}/c-library"
	 system "make", "install"
