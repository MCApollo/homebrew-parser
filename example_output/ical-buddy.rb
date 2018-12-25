name :
	 IcalBuddy
homepage :
	 https://hasseg.org/icalBuddy/
url :
	 https://github.com/ali-rantakari/icalBuddy/archive/v1.8.10.tar.gz
description :
	 Get events and tasks from the macOS calendar database
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
	 args = %W[icalBuddy icalBuddy.1 icalBuddyLocalization.1
	 icalBuddyConfig.1 COMPILER=#{ENV.cc}]
	 system "make", *args
	 bin.install "icalBuddy"
	 man1.install Dir["*.1"]
