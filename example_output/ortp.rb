name :
	 Ortp
homepage :
	 https://www.linphone.org/technical-corner/ortp/overview
url :
	 https://nongnu.askapache.com/linphone/ortp/sources/ortp-0.27.0.tar.gz
description :
	 Real-time transport protocol (RTP, RFC3550) library
build_deps :
	 cmake
	 pkg-config
link_deps :
	 mbedtls
optional_deps :
conflicts :
resource :
	 ['bctoolbox']
	 ['https://github.com/BelledonneCommunications/bctoolbox/archive/0.6.0.tar.gz']
patches :
EOF_patch :
install :
	 resource("bctoolbox").stage do
	 args = std_cmake_args + %W[
	 -DCMAKE_INSTALL_PREFIX=#{libexec}
	 -DENABLE_TESTS_COMPONENT=OFF
	 ]
	 system "cmake", ".", *args
	 system "make", "install"
	 end
	 libbctoolbox = (libexec/"lib/libbctoolbox.dylib").readlink
	 MachO::Tools.change_dylib_id("#{libexec}/lib/libbctoolbox.dylib",
	 "#{libexec}/lib/#{libbctoolbox}")
	 ENV.prepend_path "PKG_CONFIG_PATH", libexec/"lib/pkgconfig"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
