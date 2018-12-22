name :
	 AtlassianCli
homepage :
	 https://bobswift.atlassian.net/wiki/pages/viewpage.action?pageId=1966101
url :
	 https://bobswift.atlassian.net/wiki/download/attachments/16285777/atlassian-cli-8.0.0-distribution.zip
description :
	 Command-line interface clients for Atlassian products
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 Dir.glob("*.sh") do |f|
	 cmd = File.basename(f, ".sh")
	 inreplace cmd + ".sh", "`dirname $0`", share
	 bin.install cmd + ".sh" => cmd
	 end
	 share.install "lib", "license"
