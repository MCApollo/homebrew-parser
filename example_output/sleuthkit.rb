name :
	 Sleuthkit
homepage :
	 https://www.sleuthkit.org/
url :
	 https://github.com/sleuthkit/sleuthkit/releases/download/sleuthkit-4.6.4/sleuthkit-4.6.4.tar.gz
description :
	 Forensic toolkit
build_deps :
	 ant
link_deps :
	 afflib
	 :java
	 libewf
	 libpq
	 sqlite
conflicts :
	 irods
	 ffind
patches :
EOF_patch :
install :
	 ENV.append_to_cflags "-DNDEBUG"
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
	 cd "bindings/java" do
	 system "ant"
