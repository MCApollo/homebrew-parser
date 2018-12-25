name :
	 Tmux
homepage :
	 https://tmux.github.io/
url :
	 https://github.com/tmux/tmux/releases/download/2.8/tmux-2.8.tar.gz
description :
	 Terminal multiplexer
build_deps :
	 pkg-config
link_deps :
	 libevent
optional_deps :
	 utf8proc
conflicts :
resource :
	 ['completion']
	 ['https://raw.githubusercontent.com/imomaliev/tmux-bash-completion/homebrew_1.0.0/completions/tmux']
patches :
EOF_patch :
install :
	 system "sh", "autogen.sh" if build.head?
	 args = %W[
	 --disable-Dependency-tracking
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}
	 ]
	 args << "--enable-utf8proc" if build.with?("utf8proc")
	 ENV.append "LDFLAGS", "-lresolv"
	 system "./configure", *args
	 system "make", "install"
	 pkgshare.install "example_tmux.conf"
	 bash_completion.install resource("completion")
