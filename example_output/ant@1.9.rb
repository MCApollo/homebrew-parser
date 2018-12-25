name :
	 AntAT19
homepage :
	 https://ant.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=ant/binaries/apache-ant-1.9.13-bin.tar.bz2
description :
	 Java build tool
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
	 rm Dir["bin/*.{bat,cmd,dll,exe}"]
	 libexec.install Dir["*"]
	 bin.install_symlink Dir["#{libexec}/bin/*"]
	 rm bin/"ant"
	 (bin/"ant").write <<~EOS
	 #!/bin/sh
	 #{libexec}/bin/ant -lib #{HOMEBREW_PREFIX}/share/ant "$@"
	 EOS
