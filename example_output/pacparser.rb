name :
	 Pacparser
homepage :
	 https://github.com/pacparser/pacparser
url :
	 https://github.com/pacparser/pacparser/archive/1.3.7.tar.gz
description :
	 Library to parse proxy auto-config (PAC) files
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
	 ENV["VERSION"] = version
	 Dir.chdir "src"
	 system "make", "install", "PREFIX=#{prefix}"
