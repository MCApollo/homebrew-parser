name :
	 Avian
homepage :
	 https://readytalk.github.io/avian/
url :
	 https://github.com/ReadyTalk/avian/archive/v1.2.0.tar.gz
description :
	 Lightweight VM and class library for a subset of Java features
build_deps :
link_deps :
	 :java
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 system "make", "use-clang=true"
	 bin.install Dir["build/macosx-*/avian*"]
	 lib.install Dir["build/macosx-*/*.dylib", "build/macosx-*/*.a"]
