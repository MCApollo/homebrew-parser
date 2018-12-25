name :
	 Prettyping
homepage :
	 https://denilsonsa.github.io/prettyping/
url :
	 https://github.com/denilsonsa/prettyping/archive/v1.0.1.tar.gz
description :
	 Wrapper to colorize and simplify ping's output
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/6ecea23/prettyping/ipv6.patch
EOF_patch :
install :
	 bin.install "prettyping"
