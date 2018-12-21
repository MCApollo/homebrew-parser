name :
	 Rethinkdb
homepage :
	 https://www.rethinkdb.com/
url :
	 https://download.rethinkdb.com/dist/rethinkdb-2.3.6.tgz
description :
	 The open-source database for the realtime web
build_deps :
	 boost
link_deps :
	 :macos
	 openssl
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/fb00ee376a/rethinkdb/xcode9.patch
EOF_patch :
install :
	 args = ["--prefix=#{prefix}"]
	 args += ["--fetch", "protobuf"]
	 system "./configure", *args
	 system "make"
	 system "make", "install-osx"
	 (var/"log/rethinkdb").mkpath
	 inreplace "packaging/assets/config/default.conf.sample",
	 /^
	 etc.install "packaging/assets/config/default.conf.sample" => "rethinkdb.conf"
