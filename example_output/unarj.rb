name :
	 Unarj
homepage :
	 http://www.arjsoftware.com/files.htm
url :
	 https://src.fedoraproject.org/repo/pkgs/unarj/unarj-2.65.tar.gz/c6fe45db1741f97155c7def322aa74aa/unarj-2.65.tar.gz
description :
	 ARJ file archiver
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['testfile']
	 ['https://s3.amazonaws.com/ARJ/ARJ286.EXE']
patches :
EOF_patch :
install :
	 system "make"
	 bin.mkdir
	 system "make", "install", "INSTALLDIR=#{bin}"
