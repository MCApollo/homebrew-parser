name :
	 VampPluginSdk
homepage :
	 https://www.vamp-plugins.org/
url :
	 https://code.soundsoftware.ac.uk/attachments/download/2206/vamp-plugin-sdk-2.7.1.tar.gz
description :
	 Audio processing plugin system sdk
build_deps :
	 automake
	 pkg-config
link_deps :
	 flac
	 libogg
	 libsndfile
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
