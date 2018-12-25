name :
	 DropboxUploader
homepage :
	 https://www.andreafabrizi.it/2016/01/01/Dropbox-Uploader/
url :
	 https://github.com/andreafabrizi/Dropbox-Uploader/archive/1.0.tar.gz
description :
	 Bash script for interacting with Dropbox
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.install "dropbox_uploader.sh", "dropShell.sh"
