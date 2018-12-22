name :
	 V8AT315
homepage :
	 https://github.com/v8/v8/wiki
url :
	 https://github.com/v8/v8-git-mirror/archive/3.15.11.18.tar.gz
description :
	 Google's open source JavaScript engine
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.cxx11
	 ENV["GYP_DEFINES"] = "clang=1 mac_deployment_target=#{MacOS.version}"
	 (buildpath/"build/gyp").install resource("gyp")
	 inreplace "tools/gyp/v8.gyp",
	 "'OTHER_LDFLAGS': ['-dynamiclib', '-all_load']",
	 "\\0, 'DYLIB_INSTALL_NAME_BASE': '#{opt_lib}'"
	 system "make", "native",
	 "-j#{ENV.make_jobs}",
	 "library=shared",
	 "snapshot=on",
	 "console=readline"
	 prefix.install "include"
	 cd "out/native" do
	 lib.install Dir["lib*"]
	 bin.install "d8", "lineprocessor", "mksnapshot", "preparser", "process", "shell" => "v8"
	 end
