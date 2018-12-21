name :
	 Joshua
homepage :
	 https://joshua.incubator.apache.org/
url :
	 https://cs.jhu.edu/~post/files/joshua-6.0.5.tgz
description :
	 Statistical machine translation decoder
build_deps :
	 ant
	 boost
	 md5sha1sum
	 python@2
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm Dir["lib/*.{gr,tar.gz}"]
	 rm_rf "lib/README"
	 rm_rf "bin/.gitignore"
	 head do
	 system "ant"
