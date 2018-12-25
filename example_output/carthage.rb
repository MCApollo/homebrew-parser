name :
	 Carthage
homepage :
	 https://github.com/Carthage/Carthage
url :
	 https://github.com/Carthage/Carthage.git
description :
	 Decentralized dependency manager for Cocoa
build_deps :
link_deps :
	 :xcode
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "prefix_install", "PREFIX=#{prefix}"
	 bash_completion.install "Source/Scripts/carthage-bash-completion" => "carthage"
	 zsh_completion.install "Source/Scripts/carthage-zsh-completion" => "_carthage"
	 fish_completion.install "Source/Scripts/carthage-fish-completion" => "carthage.fish"
