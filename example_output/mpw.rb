name :
	 Mpw
homepage :
	 https://masterpasswordapp.com/
url :
	 https://masterpasswordapp.com/mpw-2.6-cli-5-0-g344771db.tar.gz
description :
	 Stateless/deterministic password and identity manager
build_deps :
link_deps :
	 json-c
	 libsodium
	 ncurses
conflicts :
patches :
EOF_patch :
install :
	 cd "platform-independent/cli-c" if build.head?
	 ENV["targets"] = "mpw"
	 ENV["mpw_json"] = "1"
	 ENV["mpw_color"] = "1"
	 system "./build"
	 system "./mpw-cli-tests"
	 bin.install "mpw"
