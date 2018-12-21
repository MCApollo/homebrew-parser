name :
	 Veraxx
homepage :
	 https://bitbucket.org/verateam/vera
url :
	 https://bitbucket.org/verateam/vera/downloads/vera++-1.3.0.tar.gz
description :
	 Programmable tool for C++ source code
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 resource("boost").stage do
	 system "./bootstrap.sh", "--prefix=#{buildpath}/3rdParty",
	 "--with-libraries=filesystem,system,program_options,regex,wave,python"
	 system "./b2", "install", "threading=multi", "link=static", "warnings=off",
	 "cxxflags=-DBOOST_WAVE_SUPPORT_MS_EXTENSIONS=1", "-s NO_BZIP2=1"
