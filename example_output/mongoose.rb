name :
	 Mongoose
homepage :
	 https://github.com/cesanta/mongoose
url :
	 https://github.com/cesanta/mongoose/archive/6.13.tar.gz
description :
	 Web server build on top of Libmongoose embedded library
build_deps :
link_deps :
	 openssl
conflicts :
	 suite-sparse
patches :
EOF_patch :
install :
	 cd "examples/simplest_web_server" do
	 system "make"
	 bin.install "simplest_web_server" => "mongoose"
