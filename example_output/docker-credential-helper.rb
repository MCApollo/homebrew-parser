name :
	 DockerCredentialHelper
homepage :
	 https://github.com/docker/docker-credential-helpers
url :
	 https://github.com/docker/docker-credential-helpers/archive/v0.6.1.tar.gz
description :
	 macOS Credential Helper for Docker
build_deps :
	 go
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GOPATH"] = buildpath
	 dir = buildpath/"src/github.com/docker/docker-credential-helpers"
	 dir.install buildpath.children - [buildpath/".brew_home"]
	 cd dir do
	 system "make", "vet_osx"
	 system "make", "osxkeychain"
	 bin.install "bin/docker-credential-osxkeychain"
	 prefix.install_metafiles
	 end
