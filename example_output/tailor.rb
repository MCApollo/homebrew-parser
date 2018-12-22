name :
	 Tailor
homepage :
	 https://tailor.sh
url :
	 https://github.com/sleekbyte/tailor/releases/download/v0.12.0/tailor-0.12.0.tar
description :
	 Cross-platform static analyzer and linter for Swift
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 bin.install_symlink libexec/"bin/tailor"
	 man1.install libexec/"tailor.1"
