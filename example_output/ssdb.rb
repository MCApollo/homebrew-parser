name :
	 Ssdb
homepage :
	 http://ssdb.io/
url :
	 https://github.com/ideawu/ssdb/archive/1.9.4.tar.gz
description :
	 NoSQL database supporting many data structures: Redis alternative
build_deps :
	 autoconf
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "tools/ssdb-cli", /^DIR=.*$/, "DIR=#{prefix}"
	 system "make", "CC=#{ENV.cc}", "CXX=#{ENV.cxx}"
	 system "make", "install", "PREFIX=#{prefix}"
	 %w[bench cli dump repair server].each do |suffix|
	 bin.install "#{prefix}/ssdb-#{suffix}"
