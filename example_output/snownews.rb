name :
	 Snownews
homepage :
	 https://github.com/kouya/snownews
url :
	 https://github.com/kouya/snownews/archive/v1.5.13.tar.gz
description :
	 Text mode RSS newsreader
build_deps :
link_deps :
	 gettext
	 openssl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if MacOS.version == :sierra || MacOS.version == :el_capitan
	 ENV["SDKROOT"] = MacOS.sdk_path
	 end
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install", "EXTRA_LDFLAGS=#{ENV.ldflags} -L#{Formula["openssl"].opt_lib} -lz", "CC=#{ENV.cc}"
