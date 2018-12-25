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
optional_deps :
conflicts :
resource :
	 []
	 []
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
	 end
	 chmod 0644, "correct.c"
	 inreplace "correct.c", "getline", "getline_ispell"
	 system "make", "config.sh"
	 chmod 0644, "config.sh"
	 inreplace "config.sh", "/usr/share/dict", "#{share}/dict"
	 (lib/"ispell").mkpath
	 system "make", "install"
