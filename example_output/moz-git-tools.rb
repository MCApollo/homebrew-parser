name :
	 MozGitTools
homepage :
	 https://github.com/mozilla/moz-git-tools
url :
	 https://github.com/mozilla/moz-git-tools.git
description :
	 Tools for working with Git at Mozilla
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
	 bin_array = Dir.glob("git*").push("hg-patch-to-git-patch")
	 bin_array.delete("git-root")
	 bin_array.delete("git-bz-moz")
	 bin_array.each { |e| bin.install e }
