name :
	 Creduce
homepage :
	 https://embed.cs.utah.edu/creduce/
url :
	 https://embed.cs.utah.edu/creduce/creduce-2.8.0.tar.gz
description :
	 Reduce a C/C++ program while keeping a property of interest
build_deps :
link_deps :
	 astyle
	 clang-format
	 delta
	 llvm
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 ENV["CLANG_FORMAT"] = Formula["llvm"].opt_bin/"clang-format"
	 resources.each do |r|
	 r.stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make"
	 system "make", "install"
