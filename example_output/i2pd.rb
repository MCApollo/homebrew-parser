name :
	 I2pd
homepage :
	 https://i2pd.website/
url :
	 https://github.com/PurpleI2P/i2pd/archive/2.22.0.tar.gz
description :
	 Full-featured C++ implementation of I2P client
build_deps :
link_deps :
	 boost
	 miniupnpc
	 openssl@1.1
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "install", "DEBUG=no", "HOMEBREW=1", "USE_UPNP=yes", "USE_AENSI=no", "USE_AVX=no", "PREFIX=#{prefix}"
	 confdir = etc/"i2pd"
	 rm_rf prefix/"etc"
	 confdir.install doc/"i2pd.conf", doc/"subscriptions.txt", doc/"tunnels.conf"
	 end
	 def post_install
	 datadir = var/"lib/i2pd"
	 if datadir.exist?
	 rm datadir/"certificates"
	 datadir.install_symlink pkgshare/"certificates"
	 else
	 datadir.dirname.mkpath
	 datadir.install_symlink pkgshare/"certificates", etc/"i2pd/i2pd.conf", etc/"i2pd/subscriptions.txt", etc/"i2pd/tunnels.conf"
	 end
	 (var/"log/i2pd").mkpath
