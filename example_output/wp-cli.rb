name :
	 WpCli
homepage :
	 https://wp-cli.org/
url :
	 https://github.com/wp-cli/wp-cli/releases/download/v2.0.1/wp-cli-2.0.1.phar
description :
	 Command-line interface for WordPress
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
	 bin.install "wp-cli-#{version}.phar" => "wp"
