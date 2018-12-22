name :
	 Nim
homepage :
	 https://nim-lang.org/
url :
	 https://nim-lang.org/download/nim-0.19.0.tar.xz
description :
	 Statically typed, imperative programming language
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 resource("csources").stage do
	 system "/bin/sh", "build.sh"
	 build_bin = buildpath/"bin"
	 build_bin.install "bin/nim"
	 end
	 else
	 system "/bin/sh", "build.sh"
	 end
	 system "bin/nim", "c", "-d:release", "koch"
	 system "./koch", "boot", "-d:release", "-d:useLinenoise"
	 system "./koch", "tools"
	 system "./koch", "geninstall"
	 system "/bin/sh", "install.sh", prefix
	 bin.install_symlink prefix/"nim/bin/nim"
	 bin.install_symlink prefix/"nim/bin/nim" => "nimrod"
	 target = prefix/"nim/bin"
	 target.install "bin/nimsuggest"
	 target.install "bin/nimble"
	 target.install "bin/nimgrep"
	 bin.install_symlink prefix/"nim/bin/nimsuggest"
	 bin.install_symlink target/"nimble"
	 bin.install_symlink target/"nimgrep"
