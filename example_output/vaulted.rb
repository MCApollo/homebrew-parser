name :
	 Vaulted
homepage :
	 https://github.com/miquella/vaulted
url :
	 https://github.com/miquella/vaulted/archive/v2.3.0.tar.gz
description :
	 Allows the secure storage and execution of environments
build_deps :
	 go
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["GO111MODULE"] = "on"
	 system "go", "build", "-o", bin/"vaulted", "."
	 man1.install Dir["doc/man/vaulted*.1"]
