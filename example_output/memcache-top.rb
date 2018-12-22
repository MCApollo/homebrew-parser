name :
	 MemcacheTop
homepage :
	 https://code.google.com/archive/p/memcache-top/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/memcache-top/memcache-top-v0.6
description :
	 Grab real-time stats from memcache
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "memcache-top-v#{version}" => "memcache-top"
