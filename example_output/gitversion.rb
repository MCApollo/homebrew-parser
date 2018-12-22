name :
	 Gitversion
homepage :
	 https://github.com/GitTools/GitVersion
url :
	 https://github.com/GitTools/GitVersion/releases/download/v4.0.0/GitVersion-bin-net40-v4.0.0.zip
description :
	 Easy semantic versioning for projects using Git
build_deps :
link_deps :
	 mono
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 (bin/"gitversion").write <<~EOS
	 #!/bin/sh
	 exec "mono" "#{libexec}/GitVersion.exe" "$@"
	 EOS
