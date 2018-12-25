name :
	 PinboardNotesBackup
homepage :
	 https://github.com/bdesham/pinboard-notes-backup
url :
	 https://github.com/bdesham/pinboard-notes-backup/archive/v1.0.3.tar.gz
description :
	 Efficiently back up the notes you've saved to Pinboard
build_deps :
	 cabal-install
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
	 install_cabal_package
