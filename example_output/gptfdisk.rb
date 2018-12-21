name :
	 Gptfdisk
homepage :
	 https://www.rodsbooks.com/gdisk/
url :
	 https://downloads.sourceforge.net/project/gptfdisk/gptfdisk/1.0.4/gptfdisk-1.0.4.tar.gz
description :
	 Text-mode partitioning tools
build_deps :
link_deps :
	 popt
conflicts :
patches :
EOF_patch :
install :
	 system "make", "-f", "Makefile.mac"
	 %w[cgdisk fixparts gdisk sgdisk].each do |program|
	 bin.install program
	 man8.install "#{program}.8"
