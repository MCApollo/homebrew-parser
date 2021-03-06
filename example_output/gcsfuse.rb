name :
	 Gcsfuse
homepage :
	 https://github.com/googlecloudplatform/gcsfuse
url :
	 https://github.com/GoogleCloudPlatform/gcsfuse/archive/v0.23.0.tar.gz
description :
	 User-space file system for interacting with Google Cloud
build_deps :
	 go
link_deps :
	 :osxfuse
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.delete("GOPATH")
	 system "go", "build", "./tools/build_gcsfuse"
	 if build.head?
	 gcsfuse_version = `git rev-parse --short HEAD`.strip
	 else
	 gcsfuse_version = version
	 end
	 system "./build_gcsfuse", buildpath, prefix, gcsfuse_version
