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
optional_deps :
conflicts :
resource :
	 ['swagger']
	 ['https://raw.githubusercontent.com/Azure/autorest/764d308b3b75ba83cb716708f5cef98e63dde1f7/Samples/petstore/petstore.json']
patches :
EOF_patch :
install :
	 libexec.install Dir["tools/*"]
	 (bin/"autorest").write <<~EOS
	 #!/bin/bash
	 mono #{libexec}/AutoRest.exe "$@"
	 EOS
