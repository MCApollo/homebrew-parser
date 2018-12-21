name :
	 Unicorn
homepage :
	 https://www.unicorn-engine.org/
url :
	 https://github.com/unicorn-engine/unicorn/archive/1.0.1.tar.gz
description :
	 Lightweight multi-architecture CPU emulation framework
build_deps :
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["PREFIX"] = prefix
	 ENV["UNICORN_ARCHS"] = "x86 x86_64 arm mips aarch64 m64k ppc sparc"
	 ENV["UNICORN_SHARED"] = "yes"
	 ENV["UNICORN_DEBUG"] = "no"
	 system "make"
	 system "make", "install"
	 cd "bindings/python" do
	 system "python", *Language::Python.setup_install_args(prefix)
