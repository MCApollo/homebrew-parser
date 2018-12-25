name :
	 Gforth
homepage :
	 https://www.gnu.org/software/gforth/
url :
	 https://www.complang.tuwien.ac.at/forth/gforth/gforth-0.7.3.tar.gz
description :
	 Implementation of the ANS Forth language
build_deps :
	 emacs
link_deps :
	 libffi
	 libtool
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
	 cp Dir["#{Formula["libtool"].opt_share}/libtool/*/config.{guess,sub}"], buildpath
	 ENV.deparallelize
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "EMACS=#{Formula["emacs"].opt_bin}/emacs"
	 elisp.mkpath
	 system "make", "install", "emacssitelispdir=#{elisp}"
	 elisp.install "gforth.elc"
