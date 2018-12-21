name :
	 Rock
homepage :
	 https://ooc-lang.org/
url :
	 https://github.com/fasterthanlime/rock/archive/v0.9.10.tar.gz
description :
	 ooc compiler written in ooc
build_deps :
link_deps :
	 bdw-gc
conflicts :
patches :
EOF_patch :
install :
	 ENV["OOC_LIBS"] = prefix
	 system "make", "rescue"
	 bin.install "bin/rock"
	 man1.install "docs/rock.1"
	 prefix.install "rock.use", "sdk.use", "sdk-net.use", "sdk-dynlib.use", "pcre.use", "sdk", "README.md"
	 doc.install Dir["docs/*"]
