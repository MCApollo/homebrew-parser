name :
	 Hashpump
homepage :
	 https://github.com/bwall/HashPump
url :
	 https://github.com/bwall/HashPump/archive/v1.2.0.tar.gz
description :
	 Tool to exploit hash length extension attack
build_deps :
link_deps :
	 openssl
	 python
conflicts :
patches :
	 https://github.com/bwall/HashPump/pull/14.patch?full_index=1
EOF_patch :
install :
	 bin.mkpath
	 system "make", "INSTALLLOCATION=#{bin}",
	 "CXX=#{ENV.cxx}",
	 "install"
	 system "python3", *Language::Python.setup_install_args(prefix)
