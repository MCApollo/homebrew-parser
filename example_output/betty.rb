name :
	 Betty
homepage :
	 https://github.com/pickhardt/betty
url :
	 https://github.com/pickhardt/betty/archive/v0.1.7.tar.gz
description :
	 English-like interface for the command-line
build_deps :
link_deps :
	 ruby
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "lib", "main.rb" => "betty"
	 bin.write_exec_script libexec/"betty"
