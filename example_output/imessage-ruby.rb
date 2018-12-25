name :
	 ImessageRuby
homepage :
	 https://github.com/linjunpop/imessage
url :
	 https://github.com/linjunpop/imessage/archive/v0.3.1.tar.gz
description :
	 Command-line tool to send iMessage
build_deps :
link_deps :
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "rake", "standalone:install", "prefix=#{prefix}"
