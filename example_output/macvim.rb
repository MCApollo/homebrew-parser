name :
	 Macvim
homepage :
	 https://github.com/macvim-dev/macvim
url :
	 https://github.com/macvim-dev/macvim/archive/snapshot-153.tar.gz
description :
	 GUI for vim, made for macOS
build_deps :
	 :xcode
link_deps :
	 cscope
	 lua
	 python
conflicts :
	 vim
patches :
EOF_patch :
install :
	 if MacOS.version == :sierra || MacOS.version == :yosemite
	 ENV.delete("SDKROOT")
