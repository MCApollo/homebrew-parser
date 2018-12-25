name :
	 TeeClc
homepage :
	 https://github.com/Microsoft/team-explorer-everywhere
url :
	 https://github.com/Microsoft/team-explorer-everywhere/releases/download/14.134.0/TEE-CLC-14.134.0.zip
description :
	 Microsoft Team Explorer Everywhere command-line Client
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
	 tiny-fugue
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install "tf", "lib"
	 (libexec/"native").install "native/macosx"
	 bin.write_exec_script libexec/"tf"
	 prefix.install "ThirdPartyNotices.html"
	 share.install "help"
