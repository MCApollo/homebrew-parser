name :
	 Cssembed
homepage :
	 https://www.nczonline.net/blog/2009/11/03/automatic-data-uri-embedding-in-css-files/
url :
	 https://github.com/downloads/nzakas/cssembed/cssembed-0.4.5.jar
description :
	 Automatic data URI embedding in CSS files
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
	 libexec.install "cssembed-#{version}.jar"
	 bin.write_jar_script libexec/"cssembed-#{version}.jar", "cssembed"
