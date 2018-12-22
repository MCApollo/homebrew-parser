name :
	 Ack
homepage :
	 https://beyondgrep.com/
url :
	 https://beyondgrep.com/ack-2.24-single-file
description :
	 Search tool like grep, but optimized for programmers
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 ENV.prepend_path "PERL5LIB", libexec/"lib"
	 resource("File::Next").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make", "install"
	 end
	 system "perl", "Makefile.PL", "DESTDIR=#{buildpath}"
	 system "make"
	 libexec.install "ack"
	 chmod 0755, libexec/"ack"
	 (libexec/"lib").install "blib/lib/App"
	 (bin/"ack").write_env_script("#{libexec}/ack", :PERL5LIB => ENV["PERL5LIB"])
	 man1.install "blib/man1/ack.1"
	 else
	 bin.install "ack-#{version.to_s.tr("-", "_")}-single-file" => "ack"
	 system "pod2man", "#{bin}/ack", "ack.1"
	 man1.install "ack.1"
