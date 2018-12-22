name :
	 S6
homepage :
	 https://skarnet.org/software/s6/
url :
	 https://skarnet.org/software/s6/s6-2.7.2.0.tar.gz
description :
	 Small & secure supervision software suite
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 resources.each { |r| r.stage(buildpath/r.name) }
	 build_dir = buildpath/"build"
	 cd "skalibs" do
	 system "./configure", "--disable-shared", "--prefix=#{build_dir}", "--libdir=#{build_dir}/lib"
	 system "make", "install"
	 end
	 cd "execline" do
	 system "./configure",
	 "--prefix=#{build_dir}",
	 "--bindir=#{libexec}/execline",
	 "--with-include=#{build_dir}/include",
	 "--with-lib=#{build_dir}/lib",
	 "--with-sysdeps=#{build_dir}/lib/skalibs/sysdeps",
	 "--disable-shared"
	 system "make", "install"
	 end
	 system "./configure",
	 "--prefix=#{prefix}",
	 "--libdir=#{build_dir}/lib",
	 "--includedir=#{build_dir}/include",
	 "--with-include=#{build_dir}/include",
	 "--with-lib=#{build_dir}/lib",
	 "--with-lib=#{build_dir}/lib/execline",
	 "--with-sysdeps=#{build_dir}/lib/skalibs/sysdeps",
	 "--disable-static",
	 "--disable-shared"
	 system "make", "install"
	 bin.env_script_all_files(libexec/"bin", :PATH => "#{libexec}/execline:$PATH")
	 sbin.env_script_all_files(libexec/"sbin", :PATH => "#{libexec}/execline:$PATH")
	 (bin/"execlineb").write_env_script libexec/"execline/execlineb", :PATH => "#{libexec}/execline:$PATH"
