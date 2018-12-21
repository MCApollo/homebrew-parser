name :
	 Itstool
homepage :
	 http://itstool.org/
url :
	 http://files.itstool.org/itstool/itstool-2.0.4.tar.bz2
description :
	 Make XML documents translatable through PO files
build_deps :
link_deps :
	 libxml2
	 python@2
conflicts :
patches :
	 https://github.com/itstool/itstool/commit/9b84c00.patch?full_index=1
EOF_patch :
install :
	 ENV.append_path "PYTHONPATH", "#{Formula["libxml2"].opt_lib}/python2.7/site-packages"
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{libexec}"
	 system "make", "install"
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
	 pkgshare.install_symlink libexec/"share/itstool/its"
	 man1.install_symlink libexec/"share/man/man1/itstool.1"
