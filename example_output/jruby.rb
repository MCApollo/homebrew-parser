name :
	 Jruby
homepage :
	 https://www.jruby.org/
url :
	 https://search.maven.org/remotecontent?filepath=org/jruby/jruby-dist/9.2.0.0/jruby-dist-9.2.0.0-bin.tar.gz
description :
	 Ruby implementation in pure Java
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm Dir["bin/*.{bat,dll,exe}"]
	 cd "bin" do
	 %w[ast rake rdoc ri testrb].each { |f| mv f, "j#{f}" }
	 rm "gem"
	 rm "irb"
	 end
	 rm_rf Dir["lib/jni/*"] - ["lib/jni/Darwin"]
	 libexec.install Dir["*"]
	 bin.install_symlink Dir["#{libexec}/bin/*"]
