name :
	 Mksh
homepage :
	 https://www.mirbsd.org/mksh.htm
url :
	 https://www.mirbsd.org/MirOS/dist/mir/mksh/mksh-R56c.tgz
description :
	 MirBSD Korn Shell
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "sh", "./Build.sh", "-r", "-c", (ENV.compiler == :clang) ? "lto" : "combine"
	 bin.install "mksh"
	 man1.install "mksh.1"
