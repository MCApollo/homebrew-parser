name :
	 Hydra
homepage :
	 https://github.com/vanhauser-thc/thc-hydra
url :
	 https://github.com/vanhauser-thc/thc-hydra/archive/8.6.tar.gz
description :
	 Network logon cracker which supports many services
build_deps :
	 pkg-config
link_deps :
	 mysql-client
	 openssl
	 gtk+
	 libssh
conflicts :
patches :
EOF_patch :
install :
	 inreplace "configure" do |s|
	 s.gsub! "/opt/local/lib", Formula["openssl"].opt_lib
	 s.gsub! "/opt/local/*ssl", Formula["openssl"].opt_lib
	 s.gsub! "/opt/*ssl/include", Formula["openssl"].opt_include
	 s.gsub! "libsvn", "oh_no_you_dont"
	 s.gsub! "libssh", "certainly_not" if build.without? "libssh"
	 end
	 system "./configure", "--prefix=#{prefix}"
	 bin.mkpath
	 system "make", "all", "install"
	 share.install prefix/"man"
