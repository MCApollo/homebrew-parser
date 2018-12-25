name :
	 MozillaAddonSdk
homepage :
	 https://developer.mozilla.org/en-US/Add-ons/SDK
url :
	 https://archive.mozilla.org/pub/mozilla.org/labs/jetpack/addon-sdk-1.17.zip
description :
	 Create Firefox add-ons using JS, HTML, and CSS
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
	 libexec.install Dir["*"]
	 bin.install_symlink "#{libexec}/bin/cfx"
