name :
	 Cake
homepage :
	 https://cakebuild.net/
url :
	 https://github.com/cake-build/cake/releases/download/v0.31.0/Cake-bin-net461-v0.31.0.zip
description :
build_deps :
link_deps :
	 mono
conflicts :
	 coffeescript
patches :
EOF_patch :
install :
	 libexec.install Dir["*.dll"]
	 libexec.install Dir["*.exe"]
	 libexec.install Dir["*.xml"]
	 bin.mkpath
	 (bin/"cake").write <<~EOS
	 #!/bin/bash
	 mono #{libexec}/Cake.exe "$@"
	 EOS
