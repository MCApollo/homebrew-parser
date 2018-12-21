name :
	 Texapp
homepage :
	 https://www.floodgap.com/software/texapp/
url :
	 https://www.floodgap.com/software/texapp/dist0/0.6.11.txt
description :
	 App.net client based on TTYtter
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "#{version}.txt" => "texapp"
