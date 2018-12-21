name :
	 ClearlooksPhenix
homepage :
	 https://github.com/jpfleury/clearlooks-phenix
url :
	 https://github.com/jpfleury/clearlooks-phenix/archive/7.0.1.tar.gz
description :
	 GTK+3 port of the Clearlooks Theme
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "#{Formula["gtk+3"].opt_bin}/gtk3-update-icon-cache", "-f",
	 HOMEBREW_PREFIX/"share/themes/Clearlooks-Phenix"
