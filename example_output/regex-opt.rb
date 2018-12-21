name :
	 RegexOpt
homepage :
	 https://bisqwit.iki.fi/source/regexopt.html
url :
	 https://bisqwit.iki.fi/src/arch/regex-opt-1.2.4.tar.gz
description :
	 Perl-compatible regular expression optimizer
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}", "CXX=#{ENV.cxx}"
	 bin.install "regex-opt"
