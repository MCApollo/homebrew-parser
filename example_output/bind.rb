name :
	 Bind
homepage :
	 https://www.isc.org/downloads/bind/
url :
	 https://ftp.isc.org/isc/bind9/9.12.3-P1/bind-9.12.3-P1.tar.gz
description :
	 Implementation of the DNS protocols
build_deps :
link_deps :
	 json-c
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 if MacOS.version == :sierra || MacOS.version == :el_capitan
	 ENV["SDKROOT"] = MacOS.sdk_path
	 (var/"log/named").mkpath
	 unless (var/"named").exist?
	 (var/"named").mkpath
	 (var/"named/localhost.zone").write localhost_zone
	 (var/"named/named.local").write named_local
