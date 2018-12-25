name :
	 MinioMc
homepage :
	 https://github.com/minio/mc
url :
	 https://github.com/minio/mc.git
description :
	 Replacement for ls, cp and other commands for object storage
build_deps :
	 go
link_deps :
optional_deps :
conflicts :
	 midnight-commander
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 clipath = buildpath/"src/github.com/minio/mc"
	 clipath.install Dir["*"]
	 cd clipath do
	 if build.head?
	 system "go", "build", "-o", buildpath/"mc"
	 else
	 minio_release = `git tag --points-at HEAD`.chomp
	 minio_version = minio_release.gsub(/RELEASE\./, "").chomp.gsub(/T(\d+)\-(\d+)\-(\d+)Z/, 'T\1:\2:\3Z')
	 minio_commit = `git rev-parse HEAD`.chomp
	 proj = "github.com/minio/mc"
	 system "go", "build", "-o", buildpath/"mc", "-ldflags", <<~EOS
	 -X #{proj}/cmd.Version=#{minio_version}
	 -X #{proj}/cmd.ReleaseTag=#{minio_release}
	 -X #{proj}/cmd.CommitID=#{minio_commit}
	 EOS
	 end
	 end
	 bin.install buildpath/"mc"
	 prefix.install_metafiles
