name :
	 Ckan
homepage :
	 https://github.com/KSP-CKAN/CKAN/
url :
	 https://github.com/KSP-CKAN/CKAN/releases/download/v1.25.4/ckan.exe
description :
	 The Comprehensive Kerbal Archive Network
build_deps :
link_deps :
	 mono
conflicts :
patches :
EOF_patch :
install :
	 (libexec/"bin").install "ckan.exe"
	 (bin/"ckan").write <<~EOS
	 #!/bin/sh
	 exec mono "#{libexec}/bin/ckan.exe" "$@"
	 EOS
