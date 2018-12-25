name :
	 RubyInstall
homepage :
	 https://github.com/postmodern/ruby-install#readme
url :
	 https://github.com/postmodern/ruby-install/archive/v0.7.0.tar.gz
description :
	 Install Ruby, JRuby, Rubinius, TruffleRuby, or mruby
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
	 system "make", "install", "PREFIX=#{prefix}"
