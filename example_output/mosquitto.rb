name :
	 Mosquitto
homepage :
	 https://mosquitto.org/
url :
	 https://mosquitto.org/files/source/mosquitto-1.5.5.tar.gz
description :
	 Message broker implementing the MQTT protocol
build_deps :
	 cmake
	 pkg-config
link_deps :
	 libwebsockets
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 system "cmake", ".", *std_cmake_args, "-DWITH_WEBSOCKETS=ON"
	 system "make", "install"
	 (var/"mosquitto").mkpath
