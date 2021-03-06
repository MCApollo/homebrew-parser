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
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "./nuvie.cpp" do |s|
	 s.gsub! 'datadir", "./data"', "datadir\", \"#{lib}/data\""
	 s.gsub! 'home + "/Library', '"/Library'
	 s.gsub! 'config_path.append("/Library/Preferences/Nuvie Preferences");', "config_path = \"#{var}/nuvie/nuvie.cfg\";"
	 s.gsub! "/Library/Application Support/Nuvie Support/", "#{var}/nuvie/game/"
	 s.gsub! "/Library/Application Support/Nuvie/", "#{var}/nuvie/"
	 end
	 system "./autogen.sh" if build.head?
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--disable-sdltest",
	 "--prefix=#{prefix}"
	 system "make"
	 bin.install "nuvie"
	 pkgshare.install "data"
	 (var/"nuvie/game").mkpath
