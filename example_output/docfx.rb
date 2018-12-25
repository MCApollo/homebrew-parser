name :
	 Docfx
homepage :
	 https://dotnet.github.io/docfx/
url :
	 https://github.com/dotnet/docfx/releases/download/v2.40.4/docfx.zip
description :
	 Tools for building and publishing API documentation for .NET projects
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
	 libexec.install Dir["*"]
	 (bin/"docfx").write <<~EOS
	 #!/bin/bash
	 mono #{libexec}/docfx.exe "$@"
	 EOS
