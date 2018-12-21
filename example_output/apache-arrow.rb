name :
	 ApacheArrow
homepage :
	 https://arrow.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=arrow/arrow-0.11.0/apache-arrow-0.11.0.tar.gz
description :
	 Columnar in-memory analytics layer designed to accelerate big data
build_deps :
	 cmake
link_deps :
	 boost
	 jemalloc
	 python
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 args = []
	 if build.with?("python") && build.with?("python@2")
	 odie "Cannot provide both --with-python and --with-python@2"
