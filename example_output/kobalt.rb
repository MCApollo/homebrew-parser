name :
	 Kobalt
homepage :
	 https://beust.com/kobalt/
url :
	 https://github.com/cbeust/kobalt/releases/download/1.0.122/kobalt-1.0.122.zip
description :
	 Build system
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install "kobalt-#{version}/kobalt"
	 (bin/"kobaltw").write <<~EOS
	 #!/bin/bash
	 java -jar #{libexec}/kobalt/wrapper/kobalt-wrapper.jar $*
	 EOS
