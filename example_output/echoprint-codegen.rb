name :
	 EchoprintCodegen
homepage :
	 https://github.com/spotify/echoprint-codegen
url :
	 https://github.com/echonest/echoprint-codegen/archive/v4.12.tar.gz
description :
	 Codegen for Echoprint
build_deps :
link_deps :
	 boost
	 ffmpeg
	 taglib
conflicts :
patches :
	 https://github.com/echonest/echoprint-codegen/commit/5ac72c40ae920f507f3f4da8b8875533bccf5e02.diff?full_index=1
EOF_patch :
install :
	 system "make", "-C", "src", "install", "PREFIX=#{prefix}"
