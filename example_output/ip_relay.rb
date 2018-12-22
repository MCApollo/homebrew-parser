name :
	 IpRelay
homepage :
	 http://www.stewart.com.au/ip_relay/
url :
	 http://www.stewart.com.au/ip_relay/ip_relay-0.71.tgz
description :
	 TCP traffic shaping relay application
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "ip_relay.pl" => "ip_relay"
