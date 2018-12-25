name :
	 Quex
homepage :
	 https://quex.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/quex/DOWNLOAD/quex-0.68.2.tar.gz
description :
	 Generate lexical analyzers
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
	 libexec.install "quex", "quex-exe.py"
	 doc.install "README", "demo"
	 (bin/"quex").write <<~EOS
	 #!/bin/bash
	 QUEX_PATH="#{libexec}" "#{libexec}/quex-exe.py" "$@"
	 EOS
	 if build.head?
	 man1.install "doc/manpage/quex.1"
	 else
	 man1.install "manpage/quex.1"
	 end
