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
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.prepend_path "PATH", Formula["python"].opt_libexec/"bin"
	 if build.head?
	 ln_s cached_download/".hg", ".hg"
	 system "python", "build.py", "prepare"
	 end
	 Language::Python.each_python(build) do |python, version|
	 ENV.delete("SDKROOT")
	 system python, "configure.py",
	 "--deployment-target=#{MacOS.version}",
	 "--destdir=#{lib}/python#{version}/site-packages",
	 "--bindir=#{bin}",
	 "--incdir=#{include}",
	 "--sipdir=#{HOMEBREW_PREFIX}/share/sip"
	 system "make"
	 system "make", "install"
	 system "make", "clean"
	 end
	 (HOMEBREW_PREFIX/"share/sip").mkpath
