name :
	 Savana
homepage :
	 https://github.com/codehaus/savana
url :
	 https://bintray.com/artifact/download/bintray/jcenter/org/codehaus/savana/1.2/savana-1.2-install.tar.gz
description :
	 Transactional workspaces for SVN
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
	 rm_rf Dir["bin/*.{bat,cmd}"]
	 prefix.install %w[COPYING COPYING.LESSER licenses svn-hooks]
	 libexec.install %w[bin lib logging.properties]
	 bin.write_exec_script libexec/"bin/sav"
	 bash_completion.install "etc/bash_completion" => "savana-completion.bash"
