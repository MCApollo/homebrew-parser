name :
	 Onetime
homepage :
	 https://www.red-bean.com/onetime/
url :
	 https://www.red-bean.com/onetime/onetime-1.81.tar.gz
description :
	 Encryption with one-time pads
build_deps :
link_deps :
conflicts :
patches :
	 https://github.com/kfogel/OneTime/commit/61e534e2.patch?full_index=1
	 https://github.com/kfogel/OneTime/commit/fb0a12f2.patch?full_index=1
EOF_patch :
install :
	 system "make", "prefix=#{prefix}", "install"
	 inreplace bin/"onetime", %r{^#!/usr/bin/env python$}, "#!/usr/bin/python"
