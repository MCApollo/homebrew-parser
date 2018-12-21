name :
	 Nuvie
homepage :
	 https://nuvie.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/nuvie/Nuvie/0.5/nuvie-0.5.tgz
description :
	 The Ultima 6 engine
build_deps :
link_deps :
	 sdl
conflicts :
patches :
EOF_patch :
install :
	 inreplace "./nuvie.cpp" do |s|
	 s.gsub! 'datadir", "./data"', "datadir\", \"#{lib}/data\""
	 s.gsub! 'home + "/Library', '"/Library'
	 s.gsub! 'config_path.append("/Library/Preferences/Nuvie Preferences");', "config_path = \"#{var}/nuvie/nuvie.cfg\";"
	 s.gsub! "/Library/Application Support/Nuvie Support/", "#{var}/nuvie/game/"
	 s.gsub! "/Library/Application Support/Nuvie/", "#{var}/nuvie/"
	 (var/"nuvie/game").mkpath
