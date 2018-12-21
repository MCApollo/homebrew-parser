name :
	 NicotinePlus
homepage :
	 https://www.nicotine-plus.org/
url :
	 https://github.com/Nicotine-Plus/nicotine-plus/archive/1.4.1.tar.gz
description :
	 Graphical client for the SoulSeek peer-to-peer system
build_deps :
link_deps :
	 geoip
	 gtk+
	 miniupnpc
	 pygtk
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec)
	 venv.pip_install "mutagen"
	 venv.pip_install "miniupnpc"
	 venv.pip_install "python-geoip"
	 venv.pip_install_and_link buildpath
