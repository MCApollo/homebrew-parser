name :
	 Pastebinit
homepage :
	 https://launchpad.net/pastebinit
url :
	 https://launchpad.net/pastebinit/trunk/1.5/+download/pastebinit-1.5.tar.gz
description :
	 Send things to pastebin from the command-line
build_deps :
	 docbook2x
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 inreplace "pastebinit" do |s|
	 s.gsub! "/usr/bin/python3", Formula["python"].opt_bin/"python3"
	 s.gsub! "/usr/local/etc/pastebin.d", etc/"pastebin.d"
	 end
	 system "docbook2man", "pastebinit.xml"
	 bin.install "pastebinit"
	 etc.install "pastebin.d"
	 man1.install "PASTEBINIT.1" => "pastebinit.1"
	 libexec.install %w[po utils]
