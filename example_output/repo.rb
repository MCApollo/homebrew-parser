name :
	 Repo
homepage :
	 https://source.android.com/source/developing.html
url :
	 https://gerrit.googlesource.com/git-repo.git
description :
	 Repository tool for Android development
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
	 bin.install "repo"
	 doc.install (buildpath/"docs").children
