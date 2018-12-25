name :
	 Foremost
homepage :
	 https://foremost.sourceforge.io/
url :
	 https://foremost.sourceforge.io/pkg/foremost-1.5.7.tar.gz
description :
	 Console program to recover files based on their headers and footers
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
	 s.gsub! "/usr/", "#{prefix}/"
	 s.change_make_var! "RAW_CC", ENV.cc
	 s.change_make_var! "RAW_FLAGS", ENV.cflags
	 end
	 system "make", "mac"
	 bin.install "foremost"
	 man8.install "foremost.8.gz"
	 etc.install "foremost.conf" => "foremost.conf.default"
