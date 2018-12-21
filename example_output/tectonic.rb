name :
	 Tectonic
homepage :
	 https://tectonic-typesetting.github.io/
url :
	 https://github.com/tectonic-typesetting/tectonic/archive/v0.1.11.tar.gz
description :
	 Modernized, complete, self-contained TeX/LaTeX engine
build_deps :
	 pkg-config
	 rust
link_deps :
	 freetype
	 graphite2
	 harfbuzz
	 icu4c
	 libpng
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
	 ENV["OPENSSL_DIR"] = Formula["openssl"].opt_prefix
	 system "cargo", "install", "--root", prefix, "--path", "."
	 pkgshare.install "tests"
