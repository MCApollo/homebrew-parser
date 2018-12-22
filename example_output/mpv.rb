name :
	 Mpv
homepage :
	 https://mpv.io
url :
	 https://github.com/mpv-player/mpv/archive/v0.29.1.tar.gz
description :
	 Media player based on MPlayer and mplayer2
build_deps :
	 pkg-config
	 python
link_deps :
	 ffmpeg
	 jpeg
	 libass
	 little-cms2
	 lua@5.1
	 :macos
	 mujs
	 youtube-dl
	 jack
	 libaacs
	 libarchive
	 libbluray
	 libcaca
	 libdvdnav
	 libdvdread
	 pulseaudio
	 rubberband
	 uchardet
	 vapoursynth
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 ENV["LC_ALL"] = "C"
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", buildpath/"vendor/lib/python#{xy}/site-packages"
	 resource("docutils").stage do
	 system "python3", *Language::Python.setup_install_args(buildpath/"vendor")
	 end
	 ENV.prepend_path "PATH", buildpath/"vendor/bin"
	 args = %W[
	 --prefix=#{prefix}
	 --enable-html-build
	 --enable-javascript
	 --enable-libmpv-shared
	 --enable-lua
	 --confdir=#{etc}/mpv
	 --datadir=#{pkgshare}
	 --mandir=#{man}
	 --docdir=#{doc}
	 ]
	 args << "--enable-libarchive" if build.with? "libarchive"
	 args << "--enable-libbluray" if build.with? "libbluray"
	 args << "--enable-dvdnav" if build.with? "libdvdnav"
	 args << "--enable-dvdread" if build.with? "libdvdread"
	 args << "--enable-pulse" if build.with? "pulseaudio"
	 if build.with? "lgpl"
	 args << "--enable-lgpl"
	 else
	 args << "--enable-zsh-comp"
	 args << "--zshdir=#{zsh_completion}"
