name :
	 Ispell
homepage :
	 https://lasr.cs.ucla.edu/geoff/ispell.html
url :
	 https://www.cs.hmc.edu/~geoff/tars/ispell-3.4.00.tar.gz
description :
	 International Ispell
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 cp "local.h.macos", "local.h"
	 chmod 0644, "local.h"
	 inreplace "local.h" do |s|
	 s.gsub! "/usr/local", prefix
	 s.gsub! "/man/man", "/share/man/man"
	 s.gsub! "/lib", "/lib/ispell"
