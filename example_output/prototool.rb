name :
	 Prototool
homepage :
	 https://github.com/uber/prototool
url :
	 https://github.com/uber/prototool/archive/v1.3.0.tar.gz
description :
	 Your Swiss Army Knife for Protocol Buffers
build_deps :
	 glide
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
	 dir = buildpath/"src/github.com/uber/prototool"
	 dir.install buildpath.children
	 cd dir do
	 system "make", "brewgen"
	 cd "brew" do
	 bin.install "bin/prototool"
	 bash_completion.install "etc/bash_completion.d/prototool"
	 zsh_completion.install "etc/zsh/site-functions/_prototool"
	 man1.install Dir["share/man/man1/*.1"]
	 prefix.install_metafiles
	 end
	 end
