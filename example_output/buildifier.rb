name :
	 Buildifier
homepage :
	 https://github.com/bazelbuild/buildtools
url :
	 https://github.com/bazelbuild/buildtools.git
description :
	 Format bazel BUILD files with a standard convention
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 (buildpath/"src/github.com/bazelbuild").mkpath
	 ln_sf buildpath, buildpath/"src/github.com/bazelbuild/buildtools"
	 commit = Utils.popen_read("git", "rev-parse", "HEAD").chomp
	 inreplace "buildifier/buildifier.go" do |s|
	 s.gsub! /^(var buildifierVersion = ")redacted/, "\\1#{version}"
	 s.gsub! /^(var buildScmRevision = ")redacted/, "\\1#{commit}"
	 end
	 system "go", "build", "-o", bin/"buildifier", "buildifier/buildifier.go"
