name :
	 Md
homepage :
	 https://opensource.apple.com/source/adv_cmds/adv_cmds-147/md/
url :
	 https://opensource.apple.com/tarballs/adv_cmds/adv_cmds-147.tar.gz
description :
	 Process raw dependency files produced by cpp
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "md" do
	 system ENV.cc, ENV.cflags, "-o", "md", "md.c"
	 bin.install "md"
	 man1.install "md.1"
