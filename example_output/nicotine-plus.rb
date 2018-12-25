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
optional_deps :
conflicts :
resource :
	 ['mutagen', 'python-geoip', 'miniupnpc']
	 ['https://files.pythonhosted.org/packages/14/d5/51f49f345d4490a9a6a04677ab136f78e4e0c64ed142e48b4ed818c13c96/mutagen-1.37.tar.gz', 'https://files.pythonhosted.org/packages/7c/65/cb04188154f7626e897d55f04c2542ba4205352f158cd925d314ad1998ef/python-geoip-1.2.tar.gz', 'https://files.pythonhosted.org/packages/55/90/e987e28ed29b571f315afea7d317b6bf4a551e37386b344190cffec60e72/miniupnpc-1.9.tar.gz']
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec)
	 venv.pip_install "mutagen"
	 venv.pip_install "miniupnpc"
	 venv.pip_install "python-geoip"
	 venv.pip_install_and_link buildpath
