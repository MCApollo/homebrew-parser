name :
	 Mpc
homepage :
	 https://www.musicpd.org/clients/mpc/
url :
	 https://www.musicpd.org/download/mpc/0/mpc-0.31.tar.xz
description :
	 Command-line music player client for mpd
build_deps :
	 meson
	 ninja
	 pkg-config
link_deps :
	 libmpdclient
conflicts :
patches :
EOF_patch :
install :
	 system "meson", "--prefix=#{prefix}", ".", "output"
	 system "ninja", "-C", "output"
	 system "ninja", "-C", "output", "install"
	 bash_completion.install "contrib/mpc-completion.bash" => "mpc"
	 rm share/"doc/mpc/contrib/mpc-completion.bash"
