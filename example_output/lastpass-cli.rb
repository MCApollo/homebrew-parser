name :
	 LastpassCli
homepage :
	 https://github.com/lastpass/lastpass-cli
url :
	 https://github.com/lastpass/lastpass-cli/archive/v1.3.1.tar.gz
description :
	 LastPass command-line interface tool
build_deps :
	 asciidoc
	 cmake
	 docbook-xsl
	 pkg-config
link_deps :
	 curl
	 openssl
	 pinentry
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = etc/"xml/catalog"
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args, "-DCMAKE_INSTALL_MANDIR:PATH=#{man}"
	 system "make", "all", "lpass-test", "test", "install", "install-doc"
	 end
	 bash_completion.install "contrib/lpass_bash_completion"
	 zsh_completion.install "contrib/lpass_zsh_completion" => "_lpass"
	 fish_completion.install "contrib/completions-lpass.fish"
