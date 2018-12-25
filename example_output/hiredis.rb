name :
	 Hiredis
homepage :
	 https://github.com/redis/hiredis
url :
	 https://github.com/redis/hiredis/archive/v0.14.0.tar.gz
description :
	 Minimalistic client for Redis
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["OBJARCH"] = "-arch #{MacOS.preferred_arch}"
	 system "make", "install", "PREFIX=#{prefix}"
	 pkgshare.install "examples"
