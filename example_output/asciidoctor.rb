name :
	 Asciidoctor
homepage :
	 https://asciidoctor.org/
url :
	 https://github.com/asciidoctor/asciidoctor/archive/v1.5.8.tar.gz
description :
	 Text processor and publishing toolchain for AsciiDoc
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV["GEM_HOME"] = libexec
	 system "gem", "build", "asciidoctor.gemspec"
	 system "gem", "install", "asciidoctor-#{version}.gem"
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :GEM_HOME => ENV["GEM_HOME"])
