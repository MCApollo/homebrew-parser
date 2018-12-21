name :
	 Dmd
homepage :
	 https://dlang.org/
url :
	 https://github.com/dlang/dmd/archive/v2.083.1.tar.gz
description :
	 D programming language compiler for macOS
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 make_args = ["INSTALL_DIR=#{prefix}", "MODEL=#{Hardware::CPU.bits}", "BUILD=release", "-f", "posix.mak"]
	 dmd_make_args = ["SYSCONFDIR=#{etc}", "TARGET_CPU=X86", "AUTO_BOOTSTRAP=1", "ENABLE_RELEASE=1"]
	 system "make", *dmd_make_args, *make_args
	 make_args.unshift "DMD_DIR=#{buildpath}", "DRUNTIME_PATH=#{buildpath}/druntime", "PHOBOS_PATH=#{buildpath}/phobos"
	 (buildpath/"druntime").install resource("druntime")
	 system "make", "-C", "druntime", *make_args
	 (buildpath/"phobos").install resource("phobos")
	 system "make", "-C", "phobos", "VERSION=#{buildpath}/VERSION", *make_args
	 resource("tools").stage do
	 inreplace "posix.mak", "install: $(TOOLS) $(CURL_TOOLS)", "install: $(TOOLS) $(ROOT)/dustmite"
	 system "make", "install", *make_args
	 install_new_dmd_conf
