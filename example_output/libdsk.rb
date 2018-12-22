name :
	 Libdsk
homepage :
	 https://www.seasip.info/Unix/LibDsk/
url :
	 https://www.seasip.info/Unix/LibDsk/libdsk-1.4.2.tar.gz
description :
	 Library for accessing discs and disc image files
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "Makefile.in", "SUBDIRS = . include lib tools man doc",
	 "SUBDIRS = . include lib tools man"
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
	 doc.install Dir["doc/*.{html,pdf,sample,txt}"]
	 end
	 test do
	 assert_equal "#{name} version #{version}\n", shell_output(bin/"dskutil --version")
	 end
