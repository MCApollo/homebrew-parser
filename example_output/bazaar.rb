name :
	 Bazaar
homepage :
	 https://bazaar.canonical.com/
url :
	 https://launchpad.net/bzr/2.7/2.7.0/+download/bzr-2.7.0.tar.gz
description :
	 Friendly powerful distributed version control system
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/b/bzr/bzr_2.7.0+bzr6622-9.debian.tar.xz
EOF_patch :
install :
	 ENV.deparallelize
	 system "make", "man1/bzr.1"
	 man1.install "man1/bzr.1"
	 ENV.prepend_path "PATH", "/System/Library/Frameworks/Python.framework/Versions/Current/bin"
	 system "make"
	 inreplace "bzr", "#! /usr/bin/env python", "#!/usr/bin/python"
	 libexec.install "bzr", "bzrlib"
	 (bin/"bzr").write_env_script(libexec/"bzr", :BZR_PLUGIN_PATH => "+user:#{HOMEBREW_PREFIX}/share/bazaar/plugins")
