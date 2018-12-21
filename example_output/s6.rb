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
