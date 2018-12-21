name :
	 Autorest
homepage :
	 https://github.com/Azure/autorest
url :
	 https://api.nuget.org/packages/autorest.0.17.3.nupkg
description :
	 Swagger (OpenAPI) Specification code generator
build_deps :
link_deps :
	 mono
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["tools/*"]
	 (bin/"autorest").write <<~EOS
	 #!/bin/bash
	 mono #{libexec}/AutoRest.exe "$@"
	 EOS
