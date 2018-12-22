name :
	 TomcatNative
homepage :
	 https://tomcat.apache.org/native-doc/
url :
	 https://www.apache.org/dyn/closer.cgi?path=tomcat/tomcat-connectors/native/1.2.19/source/tomcat-native-1.2.19-src.tar.gz
description :
	 Lets Tomcat use some native resources for performance
build_deps :
	 libtool
link_deps :
	 apr
	 :java
	 openssl
	 tomcat
conflicts :
patches :
EOF_patch :
install :
	 cd "native" do
	 system "./configure", "--prefix=#{prefix}",
	 "--with-apr=#{Formula["apr"].opt_prefix}",
	 "--with-java-home=#{ENV["JAVA_HOME"]}",
	 "--with-ssl=#{Formula["openssl"].opt_prefix}"
	 args = ["LIBTOOL=glibtool --tag=CC"]
	 args << "CC=#{ENV.cc}" if MacOS.version >= :mountain_lion
	 system "make", *args
	 system "make", "install"
	 end
