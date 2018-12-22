name :
	 Texmath
homepage :
	 https://johnmacfarlane.net/texmath.html
url :
	 https://hackage.haskell.org/package/texmath-0.11.1.1/texmath-0.11.1.1.tar.gz
description :
	 Haskell library for converting LaTeX math to MathML
build_deps :
	 cabal-install
	 ghc
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 install_cabal_package "--enable-tests", :flags => ["executable"] do
	 system "cabal", "test"
	 end
