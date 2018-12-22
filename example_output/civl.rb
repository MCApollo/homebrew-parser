name :
	 Civl
homepage :
	 https://vsl.cis.udel.edu/civl/
url :
	 https://vsl.cis.udel.edu/lib/sw/civl/1.7/r3157/release/CIVL-1.7_3157.tgz
description :
	 The Concurrency Intermediate Verification Language
build_deps :
link_deps :
	 :java
	 z3
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "lib/civl-1.7_3157.jar"
	 bin.write_jar_script libexec/"civl-1.7_3157.jar", "civl"
	 pkgshare.install "doc", "emacs", "examples", "licenses"
