name :
	 Duck
homepage :
	 https://duck.sh/
url :
	 https://dist.duck.sh/duck-src-6.8.0.28825.tar.gz
description :
	 Command-line interface for Cyberduck (a multi-protocol file transfer tool)
build_deps :
	 ant
	 maven
	 :xcode
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
	 revision = version.to_s.rpartition(".").last
	 system "mvn", "-DskipTests", "-Dgit.commitsCount=#{revision}",
	 "--projects", "cli/osx", "--also-make", "verify"
	 libexec.install Dir["cli/osx/target/duck.bundle/*"]
	 bin.install_symlink "#{libexec}/Contents/MacOS/duck" => "duck"
