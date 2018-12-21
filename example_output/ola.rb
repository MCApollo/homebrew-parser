name :
	 Ola
homepage :
	 https://www.openlighting.org/ola/
url :
	 https://github.com/OpenLightingProject/ola/releases/download/0.10.7/ola-0.10.7.tar.gz
description :
	 Open Lighting Architecture for lighting control information
build_deps :
	 pkg-config
link_deps :
	 liblo
	 libmicrohttpd
	 libusb
	 ossp-uuid
	 protobuf@3.1
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 resource("protobuf-c").stage do
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{buildpath}/vendor/protobuf-c"
	 system "make", "install"
