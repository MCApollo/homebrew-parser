name :
	 Passenger
homepage :
	 https://www.phusionpassenger.com/
url :
	 https://github.com/phusion/passenger/releases/download/release-6.0.0/passenger-6.0.0.tar.gz
description :
	 Server for Ruby, Python, and Node.js apps via Apache/NGINX
build_deps :
link_deps :
	 :macos
	 openssl
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 ENV.delete("SDKROOT")
	 inreplace "src/ruby_supportlib/phusion_passenger/platform_info/openssl.rb" do |s|
	 s.gsub! "-I/usr/local/opt/openssl/include", "-I#{Formula["openssl"].opt_include}"
	 s.gsub! "-L/usr/local/opt/openssl/lib", "-L#{Formula["openssl"].opt_lib}"
