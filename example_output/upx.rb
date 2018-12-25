name :
	 Upx
homepage :
	 https://upx.github.io/
url :
description :
	 Compress/expand executable files
build_deps :
link_deps :
	 ucl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/upx/upx/commit/0dac6b7be3339ac73051d40ed4d268cd2bb0dc7c.patch?full_index=1
	 https://github.com/upx/upx/commit/9bb6854e642a2505102b9d3f9ec8535ec8ab6d9c.patch?full_index=1
EOF_patch :
install :
	 (buildpath/"src/lzma-sdk").install resource("lzma-sdk") if build.stable?
	 system "make", "all"
	 bin.install "src/upx.out" => "upx"
	 man1.install "doc/upx.1"
