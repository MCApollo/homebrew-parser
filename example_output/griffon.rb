name :
	 Griffon
homepage :
	 http://griffon-framework.org/
url :
	 https://dl.bintray.com/content/aalmiray/Griffon/griffon-1.5.0-bin.tgz
description :
	 Application framework for desktop applications in the JVM
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
	 rm_f Dir["bin/*.bat"]
	 libexec.install Dir["*"]
	 bin.install_symlink Dir["#{libexec}/bin/*"]
