name :
	 Doxymacs
homepage :
	 https://doxymacs.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/doxymacs/doxymacs/1.8.0/doxymacs-1.8.0.tar.gz
description :
	 Elisp package for using doxygen under Emacs
build_deps :
link_deps :
	 doxygen
	 emacs
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version == :sierra || MacOS.version == :el_capitan
	 ENV["SDKROOT"] = MacOS.sdk_path
