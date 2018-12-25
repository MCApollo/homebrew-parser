name :
	 Scriptcs
homepage :
	 https://github.com/scriptcs/scriptcs
url :
	 https://github.com/scriptcs/scriptcs/archive/v0.17.1.tar.gz
description :
	 Tools to write and execute C#
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
	 script_file = "scriptcs.sh"
	 system "sh", "./build_brew.sh"
	 libexec.install Dir["src/ScriptCs/bin/Release/*"]
	 (libexec/script_file).write <<~EOS
	 #!/bin/bash
	 mono #{libexec}/scriptcs.exe $@
	 EOS
	 (libexec/script_file).chmod 0755
	 bin.install_symlink libexec/script_file => "scriptcs"
