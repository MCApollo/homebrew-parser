name :
	 Yaws
homepage :
	 http://yaws.hyber.org
url :
	 http://yaws.hyber.org/download/yaws-2.0.6.tar.gz
description :
	 Webserver for dynamic content (written in Erlang)
build_deps :
link_deps :
	 erlang@20
conflicts :
patches :
EOF_patch :
install :
	 system "autoreconf", "-fvi" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--with-extrainclude=#{MacOS.sdk_path}/usr/include/security"
	 system "make", "install"
	 cd "applications/yapp" do
	 system "make"
	 system "make", "install"
	 end
	 (lib/"yaws/examples/ebin").mkpath
	 (lib/"yaws/examples/include").mkpath
	 (var/"log/yaws").mkpath
	 (var/"yaws/www").mkpath
