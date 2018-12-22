name :
	 GitTf
homepage :
	 https://archive.codeplex.com/?p=gittf
url :
	 https://download.microsoft.com/download/A/E/2/AE23B059-5727-445B-91CC-15B7A078A7F4/git-tf-2.0.3.20131219.zip
description :
	 Share changes between TFS and git
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "git-tf"
	 libexec.install "lib"
	 (libexec/"native").install "native/macosx"
	 bin.write_exec_script libexec/"git-tf"
	 doc.install Dir["Git-TF_*", "ThirdPartyNotices*"]
