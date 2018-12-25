name :
	 Dvm
homepage :
	 https://github.com/howtowhale/dvm
url :
	 https://github.com/howtowhale/dvm/archive/1.0.1.tar.gz
description :
	 Docker Version Manager
build_deps :
	 go
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/howtowhale/dvm").install buildpath.children
	 cd "src/github.com/howtowhale/dvm" do
	 system "make", "VERSION=#{version}", "UPGRADE_DISABLED=true"
	 prefix.install "dvm.sh"
	 bash_completion.install "bash_completion" => "dvm"
	 (prefix/"dvm-helper").install "dvm-helper/dvm-helper"
	 prefix.install_metafiles
	 end
