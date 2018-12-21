name :
	 GitLfs
homepage :
	 https://github.com/git-lfs/git-lfs
url :
	 https://github.com/git-lfs/git-lfs/releases/download/v2.6.1/git-lfs-v2.6.1.tar.gz
description :
	 Git extension for versioning large files
build_deps :
	 go
link_deps :
	 ruby
conflicts :
patches :
EOF_patch :
install :
	 ENV["GIT_LFS_SHA"] = ""
	 ENV["VERSION"] = version
	 (buildpath/"src/github.com/git-lfs/git-lfs").install buildpath.children
	 cd "src/github.com/git-lfs/git-lfs" do
	 ENV["GEM_HOME"] = ".gem_home"
	 system "gem", "install", "ronn"
	 system "make", "vendor"
	 system "make"
	 system "make", "man", "RONN=.gem_home/bin/ronn"
	 bin.install "bin/git-lfs"
	 man1.install Dir["man/*.1"]
	 man5.install Dir["man/*.5"]
	 doc.install Dir["man/*.html"]
