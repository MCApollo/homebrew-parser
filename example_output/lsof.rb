name :
	 Lsof
homepage :
	 https://people.freebsd.org/~abe/
url :
	 https://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_4.91.tar.bz2
description :
	 Utility to list open files
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "tar", "xf", "lsof_#{version}_src.tar"
	 cd "lsof_#{version}_src" do
	 inreplace "dialects/darwin/libproc/dfile.c",
	 "#extern\tstruct pff_tab\tPgf_tab[];", "extern\tstruct pff_tab\tPgf_tab[];"
	 ENV["LSOF_INCLUDE"] = "#{MacOS.sdk_path}/usr/include"
	 inreplace %w[
	 dialects/darwin/kmem/dlsof.h
	 dialects/darwin/kmem/machine.h
	 dialects/darwin/libproc/machine.h
	 ], "/usr/include", "#{MacOS.sdk_path}/usr/include"
	 mv "00README", "README"
	 system "./Configure", "-n", "darwin"
	 system "make"
	 bin.install "lsof"
	 man8.install "lsof.8"
	 prefix.install_metafiles
	 end
