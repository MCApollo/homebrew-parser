name :
	 Hexgui
homepage :
	 https://sourceforge.net/p/benzene/hexgui/
url :
	 https://github.com/apetresc/hexgui/archive/v0.9.2.tar.gz
description :
	 GUI for playing Hex over Hex Text Protocol
build_deps :
	 ant
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 system "ant"
	 libexec.install Dir["*"]
	 (bin/"hexgui").write_env_script libexec/"bin/hexgui", Language::Java.java_home_env("1.8")
