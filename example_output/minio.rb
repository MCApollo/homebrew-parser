name :
	 Minio
homepage :
	 https://github.com/minio/minio
url :
	 https://github.com/minio/minio.git
description :
	 Amazon S3 compatible object storage server
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 clipath = buildpath/"src/github.com/minio/minio"
	 clipath.install Dir["*"]
	 cd clipath do
	 if build.head?
	 system "go", "build", "-o", buildpath/"minio"
	 else
	 release = `git tag --points-at HEAD`.chomp
	 version = release.gsub(/RELEASE\./, "").chomp.gsub(/T(\d+)\-(\d+)\-(\d+)Z/, 'T\1:\2:\3Z')
	 commit = `git rev-parse HEAD`.chomp
	 proj = "github.com/minio/minio"
	 system "go", "build", "-o", buildpath/"minio", "-ldflags", <<~EOS
	 -X #{proj}/cmd.Version=#{version}
	 -X #{proj}/cmd.ReleaseTag=#{release}
	 -X #{proj}/cmd.CommitID=#{commit}
	 EOS
	 end
	 end
	 bin.install buildpath/"minio"
	 prefix.install_metafiles
	 (var/"minio").mkpath
	 (etc/"minio").mkpath
