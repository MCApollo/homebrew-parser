name :
	 Frotz
homepage :
	 https://github.com/DavidGriffith/frotz
url :
	 https://github.com/DavidGriffith/frotz/archive/2.44.tar.gz
description :
	 Infocom-style interactive fiction player
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "Makefile" do |s|
	 s.remove_make_var! %w[CC OPTS]
	 s.change_make_var! "PREFIX", prefix
	 s.change_make_var! "CONFIG_DIR", etc
	 s.change_make_var! "MAN_PREFIX", share
	 end
	 system "make", "frotz"
	 system "make", "install"
