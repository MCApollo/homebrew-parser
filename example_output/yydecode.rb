name :
	 Yydecode
homepage :
	 https://yydecode.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/yydecode/yydecode/0.2.10/yydecode-0.2.10.tar.gz
description :
	 Decode yEnc archives
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if DevelopmentTools.clang_build_version >= 900
	 inreplace "src/crc32.h", "typedef unsigned long int u_int32_t;", ""
