name :
	 Remind
homepage :
	 https://www.roaringpenguin.com/products/remind
url :
	 https://www.roaringpenguin.com/files/download/remind-03.01.15.tar.gz
description :
	 Sophisticated calendar and alarm
build_deps :
link_deps :
optional_deps :
conflicts :
	 rem
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "configure", "sleep 1", "true"
	 inreplace "src/init.c" do |s|
	 s.gsub! "sleep(5);", ""
	 s.gsub! /rkrphgvba\(.\);/, ""
	 end
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
