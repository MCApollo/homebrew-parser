name :
	 Locateme
homepage :
	 https://iharder.sourceforge.io/current/macosx/locateme
url :
	 https://downloads.sourceforge.net/project/iharder/locateme/LocateMe-v0.2.1.zip
description :
	 Find your location using Apple's geolocation services
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system ENV.cc, "-framework", "Foundation", "-framework", "CoreLocation", "LocateMe.m", "-o", "LocateMe"
	 bin.install "LocateMe"
	 man1.install "LocateMe.1"
