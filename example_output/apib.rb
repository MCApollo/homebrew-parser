name :
	 Apib
homepage :
	 https://github.com/apigee/apib
url :
	 https://github.com/apigee/apib/archive/APIB_1_0.tar.gz
description :
	 HTTP performance-testing tool
build_deps :
link_deps :
	 apr
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 unless MacOS::CLT.installed?
	 inreplace "configure" do |s|
	 s.gsub! "/usr/include/apr-1.0", "#{Formula["apr"].opt_libexec}/include/apr-1"
	 s.gsub! "/usr/include/apr-1", "#{Formula["apr"].opt_libexec}/include/apr-1"
	 end
	 ENV.append "LDFLAGS", "-L#{Formula["apr-util"].opt_libexec}/lib"
	 ENV.append "LDFLAGS", "-L#{Formula["apr"].opt_libexec}/lib"
	 ENV.append "CFLAGS", "-I#{Formula["apr"].opt_libexec}/include/apr-1"
	 ENV.append "CFLAGS", "-I#{Formula["apr-util"].opt_libexec}/include/apr-1"
