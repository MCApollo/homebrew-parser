name :
	 Dex2jar
homepage :
	 https://github.com/pxb1988/dex2jar
url :
	 https://downloads.sourceforge.net/project/dex2jar/dex2jar-2.0.zip
description :
	 Tools to work with Android .dex and Java .class files
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
	 rm_rf Dir["*.bat"]
	 prefix.install_metafiles
	 chmod 0755, Dir["*"]
	 libexec.install Dir["*"]
	 Dir.glob("#{libexec}/*.sh") do |script|
	 bin.install_symlink script => File.basename(script, ".sh")
	 end
