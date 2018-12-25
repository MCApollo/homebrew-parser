name :
	 Leiningen
homepage :
	 https://github.com/technomancy/leiningen
url :
	 https://github.com/technomancy/leiningen/archive/2.8.3.tar.gz
description :
	 Build tool for Clojure
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['jar']
	 ['https://github.com/technomancy/leiningen/releases/download/2.8.3/leiningen-2.8.3-standalone.zip']
patches :
EOF_patch :
install :
	 jar = "leiningen-#{version}-standalone.jar"
	 resource("jar").stage do
	 libexec.install "leiningen-#{version}-standalone.zip" => jar
	 end
	 inreplace "bin/lein-pkg" do |s|
	 s.change_make_var! "LEIN_JAR", libexec/jar
	 end
	 bin.install "bin/lein-pkg" => "lein"
	 bash_completion.install "bash_completion.bash" => "lein-completion.bash"
	 zsh_completion.install "zsh_completion.zsh" => "_lein"
