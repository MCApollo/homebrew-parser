name :
	 Mobiledevice
homepage :
	 https://github.com/imkira/mobiledevice
url :
	 https://github.com/imkira/mobiledevice/archive/v2.0.0.tar.gz
description :
	 CLI for Apple's Private (Closed) Mobile Device Framework
build_deps :
link_deps :
conflicts :
patches :
	 https://github.com/imkira/mobiledevice/pull/20.patch?full_index=1
EOF_patch :
install :
	 (buildpath/"symlink_framework.sh").chmod 0555
	 system "make", "install", "CC=#{ENV.cc}", "PREFIX=#{prefix}"
