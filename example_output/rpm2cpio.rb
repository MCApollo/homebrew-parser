name :
	 Rpm2cpio
homepage :
	 https://svnweb.freebsd.org/ports/head/archivers/rpm2cpio/
url :
	 https://svnweb.freebsd.org/ports/head/archivers/rpm2cpio/files/rpm2cpio?revision=259745&view=co
description :
	 Tool to convert RPM package to CPIO archive
build_deps :
link_deps :
	 xz
conflicts :
patches :
EOF_patch :
install :
	 bin.install "rpm2cpio" => "rpm2cpio.pl"
