name :
	 Trace2html
homepage :
	 https://github.com/google/trace-viewer
url :
	 https://github.com/google/trace-viewer/archive/2015-07-07.tar.gz
description :
	 Utility from Google Trace Viewer to convert JSON traces to HTML
build_deps :
link_deps :
	 python@2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 bin.install_symlink libexec/"tracing/trace2html"
