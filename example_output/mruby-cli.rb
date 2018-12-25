name :
	 MrubyCli
homepage :
	 https://github.com/hone/mruby-cli
url :
	 https://github.com/hone/mruby-cli/archive/v0.0.4.tar.gz
description :
	 Build native command-line applications for Linux, MacOS, and Windows
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["MRUBY_CLI_LOCAL"] = "true"
	 rm buildpath/"build_config.rb"
	 (buildpath/"build_config.rb").write <<~EOS
	 MRuby::Build.new do |conf|
	 toolchain :clang
	 conf.gem File.expand_path(File.dirname(__FILE__))
	 end
	 EOS
	 system "rake", "compile"
	 bin.install "mruby/build/host/bin/mruby-cli"
