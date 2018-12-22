name :
	 Libbi
homepage :
	 https://libbi.org/
url :
	 https://github.com/libbi/LibBi/archive/1.4.3.tar.gz
description :
	 Bayesian state-space modelling on parallel computer hardware
build_deps :
link_deps :
	 automake
	 boost
	 gsl
	 netcdf
	 qrupdate
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 resources.each do |r|
	 r.stage do
	 next if r.name == "thrust"
	 perl_flags = "TT_ACCEPT=y" if r.name == "Template"
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}", perl_flags
	 system "make"
	 system "make", "install"
	 end
	 end
	 (include/"thrust").install resource("thrust")
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}", "INSTALLSITESCRIPT=#{bin}"
	 inreplace "script/libbi", "#!/usr/bin/env perl", "#!/usr/bin/perl"
	 system "make"
	 system "make", "install"
	 pkgshare.install "Test.bi", "test.conf"
	 bin.env_script_all_files(libexec+"bin", :PERL5LIB => ENV["PERL5LIB"])
