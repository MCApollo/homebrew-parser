name :
	 Jslint4java
homepage :
	 https://code.google.com/archive/p/jslint4java/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/jslint4java/jslint4java-2.0.5-dist.zip
description :
	 Java wrapper for JavaScript Lint (jsl)
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 doc.install Dir["docs/*"]
	 libexec.install Dir["*.jar"]
	 bin.write_jar_script Dir[libexec/"jslint4java*.jar"].first, "jslint4java"
