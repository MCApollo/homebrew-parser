name :
	 GitTracker
homepage :
	 https://github.com/stevenharman/git_tracker
url :
	 https://github.com/stevenharman/git_tracker/archive/v2.0.0.tar.gz
description :
	 Integrate Pivotal Tracker into your Git workflow
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
	 system "rake", "standalone:install", "prefix=#{prefix}"
