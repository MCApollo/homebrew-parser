name :
	 Jam
homepage :
	 https://www.perforce.com/resources/documentation/jam
url :
	 https://swarm.workshop.perforce.com/projects/perforce_software-jam/download/main/jam-2.6.zip
description :
	 Make-like build tool
build_deps :
link_deps :
conflicts :
	 ftjam
patches :
EOF_patch :
install :
	 system "make", "CC=#{ENV.cc}", "CFLAGS=#{ENV.cflags}", "LOCATE_TARGET=bin"
	 bin.install "bin/jam", "bin/mkjambase"
