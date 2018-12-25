name :
	 Gist
homepage :
	 https://github.com/defunkt/gist
url :
	 https://github.com/defunkt/gist/archive/v5.0.0.tar.gz
description :
	 Command-line utility for uploading Gists
build_deps :
link_deps :
	 ruby
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "rake", "install", "prefix=#{prefix}"
