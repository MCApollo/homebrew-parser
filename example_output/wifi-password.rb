name :
	 WifiPassword
homepage :
	 https://github.com/rauchg/wifi-password
url :
	 https://github.com/rauchg/wifi-password/archive/0.1.0.tar.gz
description :
	 Show the current WiFi network password
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.install "wifi-password.sh" => "wifi-password"
