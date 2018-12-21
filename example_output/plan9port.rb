name :
	 Plan9port
homepage :
	 https://swtch.com/plan9port/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/plan9port/plan9port-20140306.tgz
description :
	 Many Plan 9 programs ported to UNIX-like operating systems
build_deps :
link_deps :
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 ENV["PLAN9_TARGET"] = libexec
	 (buildpath/"LOCAL.config").write "FONTSRV=fontsrv" if build.with? "x11"
	 system "./INSTALL"
	 libexec.install Dir["*"]
	 bin.install_symlink libexec/"bin/9"
	 prefix.install Dir[libexec/"mac/*.app"]
