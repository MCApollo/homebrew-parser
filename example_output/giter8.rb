name :
	 Giter8
homepage :
	 https://github.com/foundweekends/giter8
url :
	 https://github.com/foundweekends/giter8/archive/v0.11.0.tar.gz
description :
	 Generate files and directories from templates in a git repo
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 conscript_home = libexec/"conscript"
	 ENV["CONSCRIPT_HOME"] = conscript_home
	 conscript_home.install resource("launcher")
	 launcher = conscript_home/"launcher-#{resource("launcher").version}.jar"
	 conscript_home.install_symlink launcher => "sbt-launch.jar"
	 resource("conscript").stage do
	 cs = conscript_home/"foundweekends/conscript/cs"
	 cs.install "src/main/conscript/cs/launchconfig"
	 inreplace "setup.sh" do |s|
	 s.gsub! /^LJV=1.0.0$/, "LJV=1.0.1"
	 s.gsub! /.*wget .*/, ""
	 s.gsub! /^ +exec .*/, "exit"
