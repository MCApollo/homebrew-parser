name :
	 Trafficserver
homepage :
	 https://trafficserver.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=trafficserver/trafficserver-7.1.4.tar.bz2
description :
	 HTTP/1.1 compliant caching proxy server
build_deps :
link_deps :
	 openssl
	 pcre
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11 if build.stable?
	 ENV["MACOSX_DEPLOYMENT_TARGET"] = MacOS.version
	 if MacOS.version <= :lion
	 ENV.append_to_cflags "-Wno-deprecated-declarations"
	 (var/"log/trafficserver").mkpath
	 (var/"trafficserver").mkpath
	 config = etc/"trafficserver/records.config"
	 return unless File.exist?(config)
	 return if File.read(config).include?("proxy.config.admin.user_id STRING #{ENV["USER"]}")
	 config.append_lines "CONFIG proxy.config.admin.user_id STRING #{ENV["USER"]}"
