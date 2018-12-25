name :
	 Nuget
homepage :
	 https://www.nuget.org/
url :
	 https://dist.nuget.org/win-x86-commandline/v4.7.0/NuGet.exe
description :
	 Package manager for Microsoft development platform including .NET
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
	 libexec.install "NuGet.exe" => "nuget.exe"
	 (bin/"nuget").write <<~EOS
	 #!/bin/bash
	 mono #{libexec}/nuget.exe "$@"
	 EOS
