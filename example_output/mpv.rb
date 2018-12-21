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
