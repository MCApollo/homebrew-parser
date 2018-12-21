name :
	 Circleci
homepage :
	 https://circleci.com/docs/2.0/local-cli/
url :
	 https://github.com/CircleCI-Public/circleci-cli.git
description :
	 Enables you to reproduce the CircleCI environment locally
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 ENV["GO111MODULE"] = "on"
	 dir = buildpath/"src/github.com/CircleCI-Public/circleci-cli"
	 dir.install buildpath.children
	 cd dir do
	 commit = Utils.popen_read("git rev-parse --short HEAD").chomp
	 ldflags = %W[
	 -s -w
	 -X github.com/CircleCI-Public/circleci-cli/cmd.PackageManager=homebrew
	 -X github.com/CircleCI-Public/circleci-cli/version.Version=#{version}
	 -X github.com/CircleCI-Public/circleci-cli/version.Commit=#{commit}
	 ]
	 system "go", "build", "-ldflags", ldflags.join(" "),
	 "-o", bin/"circleci"
	 prefix.install_metafiles
