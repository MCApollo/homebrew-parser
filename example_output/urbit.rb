name :
	 Urbit
homepage :
	 https://urbit.org
url :
	 https://github.com/urbit/urbit.git
description :
	 Personal cloud computer
build_deps :
	 meson
	 ninja
	 pkg-config
link_deps :
	 gmp
	 libsigsegv
	 libuv
	 openssl
	 re2c
conflicts :
patches :
EOF_patch :
install :
	 system "./scripts/build"
	 bin.install "build/urbit"
