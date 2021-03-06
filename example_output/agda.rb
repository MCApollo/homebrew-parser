name :
	 Agda
homepage :
	 https://wiki.portal.chalmers.se/agda/
url :
	 https://hackage.haskell.org/package/Agda-2.5.4.2/Agda-2.5.4.2.tar.gz
description :
	 Dependently typed functional programming language
build_deps :
link_deps :
	 cabal-install
	 ghc
	 emacs
optional_deps :
conflicts :
resource :
	 ['stdlib']
	 ['https://github.com/agda/agda-stdlib.git']
patches :
EOF_patch :
install :
	 install_cabal_package :using => ["alex", "happy", "cpphs"]
	 resource("stdlib").stage lib/"agda"
	 cd lib/"agda" do
	 cabal_sandbox :home => buildpath, :keep_lib => true do
	 cabal_install "--only-dependencies"
	 cabal_install
	 system "GenerateEverything"
	 end
	 end
	 cd lib/"agda" do
	 system bin/"agda", "-i", ".", "-i", "src", "--html", "--vim", "README.agda"
	 end
	 if build.with? "emacs"
	 system bin/"agda-mode", "compile"
	 elisp.install_symlink Dir["#{share}/*/Agda-#{version}/emacs-mode/*"]
	 end
