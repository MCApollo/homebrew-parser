name :
	 Naturaldocs
homepage :
	 https://www.naturaldocs.org/
url :
	 https://downloads.sourceforge.net/project/naturaldocs/Stable%20Releases/2.0.2/Natural_Docs_2.0.2.zip
description :
	 Extensible, multi-language documentation generator
build_deps :
link_deps :
	 mono
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 (bin/"naturaldocs").write <<~EOS
	 #!/bin/bash
	 mono #{libexec}/NaturalDocs.exe "$@"
	 EOS
	 libexec.install_symlink etc/"naturaldocs" => "config"
