name :
	 GitAppraise
homepage :
	 https://github.com/google/git-appraise
url :
	 https://github.com/google/git-appraise/archive/v0.6.tar.gz
description :
	 Distributed code review system for Git repos
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/google").mkpath
	 ln_s buildpath, buildpath/"src/github.com/google/git-appraise"
	 system "go", "build", "-o", bin/"git-appraise", "github.com/google/git-appraise/git-appraise"
