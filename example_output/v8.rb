name :
	 V8
homepage :
	 https://github.com/v8/v8/wiki
url :
	 https://chromium.googlesource.com/chromium/tools/depot_tools.git
description :
	 Google's JavaScript engine
build_deps :
	 python@2
link_deps :
	 :macos
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_path "PATH", buildpath
	 ENV["DEPOT_TOOLS_UPDATE"] = "0"
	 system "gclient", "root"
	 system "gclient", "config", "--spec", <<~EOS
	 solutions = [
	 {
	 "url": "https://chromium.googlesource.com/v8/v8.git",
	 "managed": False,
	 "name": "v8",
	 "deps_file": "DEPS",
	 "custom_deps": {},
	 },
	 ]
	 target_os = [ "mac" ]
	 target_os_only = True
	 cache_dir = "#{HOMEBREW_CACHE}/gclient_cache"
	 EOS
	 system "gclient", "sync",
	 "-j", ENV.make_jobs,
	 "-r", version,
	 "--no-history",
	 "-vvv"
	 cd "v8" do
	 output_path = "out.gn/x64.release"
	 gn_args = {
	 :is_debug                     => false,
	 :is_component_build           => true,
	 :v8_use_external_startup_data => false,
	 :v8_enable_i18n_support       => true,
	 }
	 gn_args_string = gn_args.map { |k, v| "#{k}=#{v}" }.join(" ")
	 system "gn", "gen", "--args=#{gn_args_string}", output_path
	 system "ninja", "-j", ENV.make_jobs, "-C", output_path,
	 "-v", "d8"
	 include.install Dir["include/*"]
	 cd output_path do
	 lib.install Dir["lib*.dylib"]
	 libexec.install Dir["d8", "icudt*.dat"]
	 (bin/"d8").write <<~EOS
	 #!/bin/bash
	 exec "#{libexec}/d8" --icu-data-file="#{libexec}/icudtl.dat" "$@"
	 EOS
	 end
	 end
