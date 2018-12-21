name :
	 Classads
homepage :
	 https://research.cs.wisc.edu/htcondor/classad/
url :
	 http://ftp.cs.wisc.edu/condor/classad/c++/classads-1.0.10.tar.gz
description :
	 Classified Advertisements (used by HTCondor Central Manager)
build_deps :
link_deps :
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--enable-namespace", "--prefix=#{prefix}"
	 system "make", "install"
