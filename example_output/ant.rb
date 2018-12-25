name :
	 Ant
homepage :
	 https://ant.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=ant/binaries/apache-ant-1.10.5-bin.tar.xz
description :
	 Java build tool
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['bcel']
	 ['https://www.apache.org/dyn/closer.cgi?path=commons/bcel/binaries/bcel-6.2-bin.tar.gz']
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
	 if build.with? "ivy"
	 resource("ivy").stage do
	 (libexec/"lib").install Dir["ivy-*.jar"]
	 end
	 end
	 if build.with? "bcel"
	 resource("bcel").stage do
	 (libexec/"lib").install "bcel-#{resource("bcel").version}.jar"
	 end
	 end
