name :
	 Libswiften
homepage :
	 https://swift.im/swiften
url :
	 https://swift.im/downloads/releases/swift-4.0/swift-4.0.tar.gz
description :
	 C++ library for implementing XMPP applications
build_deps :
	 scons
link_deps :
	 boost
	 libidn
	 lua@5.1
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 boost = Formula["boost"]
	 libidn = Formula["libidn"]
	 lua = Formula["lua@5.1"]
	 args = %W[
	 -j #{ENV.make_jobs}
	 V=1
	 linkflags=-headerpad_max_install_names
	 optimize=1 debug=0
	 allow_warnings=1
	 swiften_dll=1
	 boost_includedir=#{boost.include}
	 boost_libdir=#{boost.lib}
	 libidn_includedir=#{libidn.include}
	 libidn_libdir=#{libidn.lib}
	 SWIFTEN_INSTALLDIR=#{prefix}
	 openssl=no
	 SLUIFT_INSTALLDIR=#{prefix}
	 lua_includedir=#{lua.include}/lua-5.1
	 lua_libdir=#{lua.lib}
	 lua_libname=lua.5.1
	 #{prefix}
	 ]
	 scons *args
