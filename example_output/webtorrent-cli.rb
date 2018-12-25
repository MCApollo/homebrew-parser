name :
	 WebtorrentCli
homepage :
	 https://webtorrent.io/
url :
	 https://registry.npmjs.org/webtorrent-cli/-/webtorrent-cli-1.12.3.tgz
description :
	 Command-line streaming torrent client
build_deps :
link_deps :
	 node
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "npm", "install", *Language::Node.std_npm_install_args(libexec)
	 bin.install_symlink Dir["#{libexec}/bin/*"]
