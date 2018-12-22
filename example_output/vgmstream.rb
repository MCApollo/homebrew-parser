name :
	 Vgmstream
homepage :
	 https://hcs64.com/vgmstream.html
url :
	 https://github.com/kode54/vgmstream/archive/r1040.tar.gz
description :
	 Library for playing streamed audio formats from video games
build_deps :
link_deps :
	 libvorbis
	 mpg123
conflicts :
patches :
EOF_patch :
install :
	 cd "test" do
	 system "make"
	 bin.install "test" => "vgmstream"
	 lib.install "../src/libvgmstream.a"
	 end
