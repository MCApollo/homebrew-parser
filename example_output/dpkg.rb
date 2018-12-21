name :
	 Dpkg
homepage :
	 https://wiki.debian.org/Teams/Dpkg
url :
	 https://dl.bintray.com/homebrew/mirror/dpkg-1.19.0.5.tar.xz
description :
	 Debian package management system
build_deps :
	 pkg-config
link_deps :
	 gnu-tar
	 gpatch
	 perl
	 xz
conflicts :
patches :
EOF_patch :
install :
	 ENV["TAR"] = Formula["gnu-tar"].opt_bin/"gtar"
	 ENV["PATCH"] = Formula["gpatch"].opt_bin/"patch"
	 ENV["PERL_LIBDIR"] = libexec/"lib/perl5"
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{libexec}",
	 "--sysconfdir=#{etc}",
	 "--localstatedir=#{var}",
	 "--disable-dselect",
	 "--disable-start-stop-daemon"
	 system "make"
	 system "make", "install"
	 bin.install Dir[libexec/"bin/*"]
	 man.install Dir[libexec/"share/man/*"]
	 (lib/"pkgconfig").install_symlink Dir[libexec/"lib/pkgconfig/*.pc"]
	 bin.env_script_all_files(libexec/"bin", :PERL5LIB => ENV["PERL5LIB"])
	 (buildpath/"dummy").write "Vendor: dummy\n"
	 (etc/"dpkg/origins").install "dummy"
	 (etc/"dpkg/origins").install_symlink "dummy" => "default"
	 (var/"lib/dpkg").mkpath
	 (var/"log").mkpath
