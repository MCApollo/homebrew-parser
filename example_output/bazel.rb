name :
	 Bazel
homepage :
	 https://bazel.build/
url :
	 https://github.com/bazelbuild/bazel/releases/download/0.20.0/bazel-0.20.0-dist.zip
description :
	 Google's own build tool
build_deps :
link_deps :
	 :java
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 ENV["EMBED_LABEL"] = "#{version}-homebrew"
	 ENV["BAZEL_WRKDIR"] = buildpath/"work"
	 (buildpath/"sources").install buildpath.children
	 cd "sources" do
	 system "./compile.sh"
	 system "./output/bazel",
	 "--output_user_root",
	 buildpath/"output_user_root",
	 "build",
	 "--host_java_toolchain=@bazel_tools//tools/jdk:toolchain_hostjdk8",
	 "--java_toolchain=@bazel_tools//tools/jdk:toolchain_hostjdk8",
	 "scripts:bash_completion"
	 bin.install "scripts/packages/bazel.sh" => "bazel"
	 bin.install "output/bazel" => "bazel-real"
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
	 bash_completion.install "bazel-bin/scripts/bazel-complete.bash"
	 zsh_completion.install "scripts/zsh_completion/_bazel"
	 prefix.install_metafiles
