name :
	 Paket
homepage :
	 https://fsprojects.github.io/Paket/
url :
	 https://github.com/fsprojects/Paket/releases/download/5.194.0/paket.exe
description :
	 Dependency manager for .NET with support for NuGet and Git repositories
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
	 libexec.install "paket.exe"
	 (bin/"paket").write <<~EOS
	 #!/bin/bash
	 mono #{libexec}/paket.exe "$@"
	 EOS
