name :
	 SbtAT013
homepage :
	 https://www.scala-sbt.org/
url :
	 https://github.com/sbt/sbt/releases/download/v0.13.18/sbt-0.13.18.tgz
description :
	 Build tool for Scala projects
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
	 inreplace "bin/sbt" do |s|
	 s.gsub! 'etc_sbt_opts_file="/etc/sbt/sbtopts"', "etc_sbt_opts_file=\"#{etc}/sbtopts\""
	 s.gsub! "/etc/sbt/sbtopts", "#{etc}/sbtopts"
	 end
	 libexec.install "bin", "lib"
	 etc.install "conf/sbtopts"
	 (bin/"sbt").write <<~EOS
	 #!/bin/sh
	 export JAVA_HOME=$(#{Language::Java.java_home_cmd("1.8")})
	 if [ -f "$HOME/.sbtconfig" ]; then
	 echo "Use of ~/.sbtconfig is deprecated, please migrate global settings to #{etc}/sbtopts" >&2
	 . "$HOME/.sbtconfig"
	 fi
	 exec "#{libexec}/bin/sbt" "$@"
	 EOS
	 end
	 def caveats;  <<~EOS
	 You can use $SBT_OPTS to pass additional JVM options to SBT:
	 SBT_OPTS="-XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"
	 This formula uses the standard Lightbend sbt launcher script.
	 Project specific options should be placed in .sbtopts in the root of your project.
	 Global settings should be placed in #{etc}/sbtopts
	 EOS
