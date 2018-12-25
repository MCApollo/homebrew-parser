name :
	 Qriollo
homepage :
	 https://qriollo.github.io
url :
	 https://qriollo.github.io/Qriollo-0.91.tar.gz
description :
	 Impure functional language, based on Rioplatense Spanish
build_deps :
	 ghc
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "qr"
	 (lib/"chamuyo").install "Chamuyo.q"
