name :
	 ArchiSteamFarm
homepage :
	 https://github.com/JustArchi/ArchiSteamFarm
url :
	 https://github.com/JustArchi/ArchiSteamFarm/releases/download/2.3.2.0/ASF.zip
description :
build_deps :
link_deps :
	 mono
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install "ASF.exe"
	 (bin/"asf").write <<~EOS
	 #!/bin/bash
	 mono #{libexec}/ASF.exe "$@"
	 EOS
	 etc.install "config" => "asf"
	 libexec.install_symlink etc/"asf" => "config"
