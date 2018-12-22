name :
	 Yuicompressor
homepage :
	 https://yui.github.io/yuicompressor/
url :
	 https://github.com/yui/yuicompressor/releases/download/v2.4.8/yuicompressor-2.4.8.zip
description :
	 Yahoo! JavaScript and CSS compressor
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "yuicompressor-#{version}.jar"
	 bin.write_jar_script libexec/"yuicompressor-#{version}.jar", "yuicompressor"
