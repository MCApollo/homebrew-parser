name :
	 Inspircd
homepage :
	 https://www.inspircd.org/
url :
	 https://github.com/inspircd/inspircd/archive/v2.0.27.tar.gz
description :
	 Modular C++ Internet Relay Chat daemon
build_deps :
	 pkg-config
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--enable-extras=m_ldapauth.cpp,m_ldapoper.cpp"
	 system "./configure", "--prefix=#{prefix}", "--with-cc=#{ENV.cc}"
	 system "make", "install"
	 inreplace "#{prefix}/org.inspircd.plist", "ircdaemon", ENV["USER"]
