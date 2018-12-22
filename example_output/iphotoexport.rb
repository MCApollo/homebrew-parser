name :
	 Iphotoexport
homepage :
	 https://code.google.com/archive/p/iphotoexport/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/iphotoexport/iphotoexport-1.6.4.zip
description :
	 Export and synchronize iPhoto library to a folder tree
build_deps :
link_deps :
	 exiftool
conflicts :
patches :
EOF_patch :
install :
	 unzip_dir = "#{name}-#{version}"
	 inreplace "#{unzip_dir}/tilutil/exiftool.py", "/usr/bin/exiftool", "exiftool"
	 prefix.install Dir["#{unzip_dir}/*"]
	 bin.install_symlink prefix+"iphotoexport.py" => "iphotoexport"
