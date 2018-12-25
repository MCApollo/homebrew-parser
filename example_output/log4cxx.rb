name :
	 Log4cxx
homepage :
	 https://logging.apache.org/log4cxx/index.html
url :
	 https://www.apache.org/dyn/closer.cgi?path=logging/log4cxx/0.10.0/apache-log4cxx-0.10.0.tar.gz
description :
	 Library of C++ classes for flexible logging
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
	 apr-util
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://gist.githubusercontent.com/cawka/b4a79f6b883c46ac1672/raw/be8b4e610a1e21b34aaaf8fb4151362dcfb782ff/LOGCXX-400,LOGCXX-404---r1414037.patch
	 https://gist.githubusercontent.com/cawka/b4a79f6b883c46ac1672/raw/4188731bd771a961a91fcfbe561f3999b555b9c3/LOG4CXX-417---r1556413.patch
	 https://gist.githubusercontent.com/cawka/b4a79f6b883c46ac1672/raw/f33998566cccf91fb84133e101f5a92a14b31aed/LOGCXX-404---domtestcase.cpp.patch
EOF_patch :
install :
	 ENV.O2
	 system "./autogen.sh"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--disable-doxygen",
	 "--with-apr=#{Formula["apr"].opt_bin}",
	 "--with-apr-util=#{Formula["apr-util"].opt_bin}"
	 system "make", "install"
