name :
	 AdrTools
homepage :
	 https://github.com/npryce/adr-tools
url :
	 https://github.com/npryce/adr-tools/archive/3.0.0.tar.gz
description :
	 CLI tool for working with Architecture Decision Records
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 config = buildpath/"src/adr-config"
	 config.unlink
	 config.write <<~EOS
	 #!/bin/bash
	 echo 'adr_bin_dir=\"#{bin}\"'
	 echo 'adr_template_dir=\"#{prefix}\"'
	 EOS
	 prefix.install Dir["src/*.md"]
	 bin.install Dir["src/*"]
