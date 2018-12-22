name :
	 Fantom
homepage :
	 https://fantom.org/
url :
	 https://bitbucket.org/fantom/fan-1.0/downloads/fantom-1.0.71.zip
description :
	 Object oriented, portable programming language
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.exe", "bin/*.dll", "lib/dotnet/*"]
	 inreplace "etc/build/config.props", "//jdkHome=/System", "jdkHome=/System"
	 libexec.install Dir["*"]
	 chmod 0755, Dir["#{libexec}/bin/*"]
	 bin.install_symlink Dir["#{libexec}/bin/*"]
