name :
	 Fibjs
homepage :
	 http://fibjs.org/
url :
	 https://github.com/fibjs/fibjs/releases/download/v0.26.1/fullsrc.zip
description :
	 JavaScript on Fiber
build_deps :
	 cmake
link_deps :
	 :macos
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 begin
	 env_ci = ENV.delete "CI"
	 system "./build", "release", "-j#{ENV.make_jobs}"
	 ensure
	 ENV["CI"] = env_ci
