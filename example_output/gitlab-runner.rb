name :
	 GitlabRunner
homepage :
	 https://gitlab.com/gitlab-org/gitlab-runner
url :
	 https://gitlab.com/gitlab-org/gitlab-runner.git
description :
	 The official GitLab CI runner written in Go
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/gitlab.com/gitlab-org/gitlab-runner"
	 dir.install buildpath.children
	 cd dir do
	 proj = "gitlab.com/gitlab-org/gitlab-runner"
	 commit = Utils.popen_read("git", "rev-parse", "--short", "HEAD").chomp
	 branch = version.to_s.split(".")[0..1].join("-") + "-stable"
	 built = Time.new.strftime("%Y-%m-%dT%H:%M:%S%:z")
	 system "go", "build", "-ldflags", <<~EOS
	 -X #{proj}/common.NAME=gitlab-runner
	 -X #{proj}/common.VERSION=#{version}
	 -X #{proj}/common.REVISION=#{commit}
	 -X #{proj}/common.BRANCH=#{branch}
	 -X #{proj}/common.BUILT=#{built}
	 EOS
	 bin.install "gitlab-runner"
	 prefix.install_metafiles
	 end
