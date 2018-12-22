name :
	 Mruby
homepage :
	 https://mruby.org/
url :
	 https://github.com/mruby/mruby/archive/2.0.0.tar.gz
description :
	 Lightweight implementation of the Ruby language
build_deps :
	 bison
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 cd "build/host/" do
	 lib.install Dir["lib/*.a"]
	 prefix.install %w[bin mrbgems mrblib]
	 end
	 prefix.install "include"
