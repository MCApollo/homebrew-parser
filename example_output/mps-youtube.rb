name :
	 MpsYoutube
homepage :
	 https://github.com/mps-youtube/mps-youtube
url :
	 https://github.com/mps-youtube/mps-youtube/archive/v0.2.8.tar.gz
description :
	 Terminal based YouTube player and downloader
build_deps :
link_deps :
	 mpv
	 python
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 ["youtube_dl", "pafy"].each do |r|
	 venv.pip_install resource(r)
