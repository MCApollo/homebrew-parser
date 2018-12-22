name :
	 Xmlsh
homepage :
	 http://www.xmlsh.org
url :
	 https://downloads.sourceforge.net/project/xmlsh/xmlsh/1.2.5/xmlsh_1_2_5.zip
description :
	 XML shell
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 rm_rf %w[win32 cygwin]
	 libexec.install Dir["*"]
	 chmod 0755, "#{libexec}/unix/xmlsh"
	 (bin/"xmlsh").write <<~EOS
	 #!/bin/bash
	 export XMLSH=#{libexec}
	 exec #{libexec}/unix/xmlsh "$@"
	 EOS
