name :
	 Libgsm
homepage :
	 http://www.quut.com/gsm/
url :
	 http://www.quut.com/gsm/gsm-1.0.18.tar.gz
description :
	 Lossy speech compression library
build_deps :
link_deps :
conflicts :
patches :
	 https://gist.githubusercontent.com/dholm/5840964/raw/1e2bea34876b3f7583888b2284b0e51d6f0e21f4/gistfile1.txt
EOF_patch :
install :
	 ENV.append_to_cflags "-c -O2 -DNeedFunctionPrototypes=1"
	 bin.mkpath
	 lib.mkpath
	 include.mkpath
	 man1.mkpath
	 man3.mkpath
	 system "make", "lib/libgsm.1.0.13.dylib",
	 "CC=#{ENV.cc}", "CCFLAGS=#{ENV.cflags}",
	 "LDFLAGS=#{ENV.ldflags}"
	 system "make", "all",
	 "CC=#{ENV.cc}", "CCFLAGS=#{ENV.cflags}",
	 "LDFLAGS=#{ENV.ldflags}"
	 system "make", "install",
	 "INSTALL_ROOT=#{prefix}",
	 "GSM_INSTALL_INC=#{include}"
	 lib.install Dir["lib/*dylib"]
