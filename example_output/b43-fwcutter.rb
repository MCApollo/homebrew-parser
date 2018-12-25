name :
	 B43Fwcutter
homepage :
	 https://wireless.kernel.org/en/users/Drivers/b43
url :
	 https://bues.ch/b43/fwcutter/b43-fwcutter-019.tar.bz2
description :
	 Extract firmware from Braodcom 43xx driver files
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
	 inreplace "Makefile" do |m|
	 m.gsub! /install -o 0 -g 0/, "install"
	 m.gsub! /install -d -o 0 -g 0/, "install -d"
	 m.gsub! "$(PREFIX)/man", man
	 end
	 system "make", "PREFIX=#{prefix}", "install"
