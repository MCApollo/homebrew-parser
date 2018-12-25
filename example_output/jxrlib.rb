name :
	 Jxrlib
homepage :
	 https://archive.codeplex.com/?p=jxrlib
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/j/jxrlib/jxrlib_1.1.orig.tar.gz
description :
	 Tools for JPEG-XR image encoding/decoding
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make"
	 lib.install %w[libjxrglue.a libjpegxr.a]
	 bin.install %w[JxrEncApp JxrDecApp]
	 include.install %w[common image]
	 include.install "jxrgluelib" => "glue"
	 include.install "jxrtestlib" => "test"
	 doc.install Dir["doc/*"]
