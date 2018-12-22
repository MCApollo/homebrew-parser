name :
	 Elixir
homepage :
	 https://elixir-lang.org/
url :
	 https://github.com/elixir-lang/elixir/archive/v1.7.4.tar.gz
description :
	 Functional metaprogramming aware language built on Erlang VM
build_deps :
link_deps :
	 erlang
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install Dir["bin/*"] - Dir["bin/*.{bat,ps1}"]
	 Dir.glob("lib/*/ebin") do |path|
	 app = File.basename(File.dirname(path))
	 (lib/app).install path
	 end
	 system "make", "install_man", "PREFIX=#{prefix}"
