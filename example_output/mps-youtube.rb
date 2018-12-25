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
optional_deps :
conflicts :
resource :
	 ['pafy', 'youtube_dl']
	 ['https://files.pythonhosted.org/packages/41/cb/ec840c79942fb0788982963b61a361ecd10e4e58ad3dcaef4f0e809ce2fe/pafy-0.5.4.tar.gz', 'https://files.pythonhosted.org/packages/6a/e0/68e3701ca58ea54aab4abb018ab9fe76807598d45d46a787a3d3c986ec1c/youtube_dl-2018.11.7.tar.gz']
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 ["youtube_dl", "pafy"].each do |r|
	 venv.pip_install resource(r)
	 end
	 venv.pip_install_and_link buildpath
