name :
	 Docker
homepage :
	 https://www.docker.com/
url :
	 https://github.com/docker/docker-ce.git
description :
	 Pack, ship and run any application as a lightweight container
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/docker/cli"
	 dir.install (buildpath/"components/cli").children
	 cd dir do
	 commit = Utils.popen_read("git rev-parse --short HEAD").chomp
	 build_time = Utils.popen_read("date -u +'%Y-%m-%dT%H:%M:%SZ' 2> /dev/null").chomp
	 ldflags = ["-X \"github.com/docker/cli/cli.BuildTime=#{build_time}\"",
	 "-X github.com/docker/cli/cli.GitCommit=#{commit}",
	 "-X github.com/docker/cli/cli.Version=#{version}",
	 "-X \"github.com/docker/cli/cli.PlatformName=Docker Engine - Community\""]
	 system "go", "build", "-o", bin/"docker", "-ldflags", ldflags.join(" "),
	 "github.com/docker/cli/cmd/docker"
	 bash_completion.install "contrib/completion/bash/docker"
	 fish_completion.install "contrib/completion/fish/docker.fish"
	 zsh_completion.install "contrib/completion/zsh/_docker"
