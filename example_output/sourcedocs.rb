name :
	 Sourcedocs
homepage :
	 https://github.com/eneko/SourceDocs
url :
	 https://github.com/eneko/SourceDocs/archive/0.5.1.tar.gz
description :
	 Generate Markdown files from inline source code documentation
build_deps :
link_deps :
	 :xcode
conflicts :
patches :
EOF_patch :
install :
	 system "swift", "build", "--disable-sandbox", "-c", "release", "-Xswiftc", "-static-stdlib"
	 bin.install ".build/release/sourcedocs"
