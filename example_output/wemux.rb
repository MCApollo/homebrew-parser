name :
	 Wemux
homepage :
	 https://github.com/zolrath/wemux
url :
	 https://github.com/zolrath/wemux/archive/v3.2.0.tar.gz
description :
	 Enhances tmux's to provide multiuser terminal multiplexing
build_deps :
link_deps :
	 tmux
conflicts :
patches :
EOF_patch :
install :
	 inreplace "wemux", "/usr/local/etc", etc
	 bin.install "wemux"
	 man1.install "man/wemux.1"
	 inreplace "wemux.conf.example", "change_this", ENV["USER"]
	 etc.install "wemux.conf.example" => "wemux.conf"
