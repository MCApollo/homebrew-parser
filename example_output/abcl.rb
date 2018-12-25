name :
	 Abcl
homepage :
	 https://abcl.org/
url :
	 https://abcl.org/releases/1.5.0/abcl-src-1.5.0.tar.gz
description :
	 Armed Bear Common Lisp: a full implementation of Common Lisp
build_deps :
link_deps :
	 ant
	 :java
	 rlwrap
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cmd = Language::Java.java_home_cmd("1.8")
	 ENV["JAVA_HOME"] = Utils.popen_read(cmd).chomp
	 system "ant"
	 libexec.install "dist/abcl.jar", "dist/abcl-contrib.jar"
	 (bin/"abcl").write <<~EOS
	 #!/bin/sh
	 export JAVA_HOME=$(#{cmd})
	 rlwrap java -cp #{libexec}/abcl.jar:"$CLASSPATH" org.armedbear.lisp.Main "$@"
	 EOS
