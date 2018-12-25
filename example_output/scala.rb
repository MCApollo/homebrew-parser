name :
	 Scala
homepage :
	 https://www.scala-lang.org/
url :
	 https://downloads.lightbend.com/scala/2.12.8/scala-2.12.8.tgz
description :
	 JVM-based programming language
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat"]
	 doc.install Dir["doc/*"]
	 share.install "man"
	 libexec.install "bin", "lib"
	 bin.install_symlink Dir["#{libexec}/bin/*"]
	 idea = prefix/"idea"
	 idea.install_symlink libexec/"src", libexec/"lib"
	 idea.install_symlink doc => "doc"
	 end
	 def caveats; <<~EOS
	 To use with IntelliJ, set the Scala home to:
	 #{opt_prefix}/idea
	 EOS
