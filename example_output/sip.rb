name :
	 Sip
homepage :
	 https://www.riverbankcomputing.com/software/sip/intro
url :
	 https://dl.bintray.com/homebrew/mirror/sip-4.19.8.tar.gz
description :
	 Tool to create Python bindings for C and C++ libraries
build_deps :
link_deps :
	 python
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_path "PATH", Formula["python"].opt_libexec/"bin"
	 if build.head?
	 ln_s cached_download/".hg", ".hg"
	 system "python", "build.py", "prepare"
	 (HOMEBREW_PREFIX/"share/sip").mkpath
