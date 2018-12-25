name :
	 Voldemort
homepage :
	 https://www.project-voldemort.com/
url :
	 https://github.com/voldemort/voldemort/archive/release-1.10.26-cutoff.tar.gz
description :
	 Distributed key-value storage system
build_deps :
	 gradle
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
	 system "./gradlew", "build", "-x", "test"
	 libexec.install %w[lib dist contrib]
	 bin.install Dir["bin/*{.sh,.py}"]
	 libexec.install "bin"
	 pkgshare.install "config" => "config-examples"
	 (etc/"voldemort").mkpath
	 env = {
	 :VOLDEMORT_HOME       => libexec,
	 :VOLDEMORT_CONFIG_DIR => etc/"voldemort",
	 }
	 bin.env_script_all_files(libexec/"bin", env)
