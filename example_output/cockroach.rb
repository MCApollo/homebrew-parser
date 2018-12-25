name :
	 Cockroach
homepage :
	 https://www.cockroachlabs.com
url :
	 https://binaries.cockroachdb.com/cockroach-v2.1.2.src.tgz
description :
	 Distributed SQL database
build_deps :
	 autoconf
	 cmake
	 go
	 make
	 xz
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.prepend_path "PATH", Formula["make"].opt_libexec/"gnubin"
	 system "make", "buildoss"
	 system "make", "install", "prefix=#{prefix}", "BUILDTYPE=release"
