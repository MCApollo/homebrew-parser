name :
	 ImageoptimCli
homepage :
	 https://jamiemason.github.io/ImageOptim-CLI/
url :
	 https://github.com/JamieMason/ImageOptim-CLI/archive/2.0.4.tar.gz
description :
	 CLI for ImageOptim, ImageAlpha and JPEGmini
build_deps :
	 node
link_deps :
optional_deps :
conflicts :
resource :
	 ['node']
	 ['https://nodejs.org/dist/v10.9.0/node-v10.9.0.tar.xz']
patches :
EOF_patch :
install :
	 resource("node").stage buildpath/".brew_home/.nexe"
	 inreplace "package.json", "\"build:bin\": \"nexe --target 'mac-x64-10.0.0' --input",
	 "\"build:bin\": \"nexe --build --target 'mac-x64-#{resource("node").version}' --loglevel=verbose --input"
	 system "npm", "ci", *Language::Node.local_npm_install_args
	 system "npm", "run-script", "build"
	 libexec.install "dist", "osascript"
	 bin.install_symlink libexec/"dist/imageoptim"
