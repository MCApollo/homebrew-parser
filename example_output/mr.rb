name :
	 Mr
homepage :
	 https://myrepos.branchable.com/
url :
	 git://myrepos.branchable.com/
description :
	 Multiple Repository management tool
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 ['test-repo']
	 ['https://github.com/Homebrew/homebrew-command-not-found.git']
patches :
EOF_patch :
install :
	 system "make"
	 bin.install "mr", "webcheckout"
	 man1.install gzip("mr.1", "webcheckout.1")
	 pkgshare.install Dir["lib/*"]
