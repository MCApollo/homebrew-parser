name :
	 Geckodriver
homepage :
	 https://github.com/mozilla/geckodriver
url :
	 https://github.com/mozilla/geckodriver/archive/v0.23.0.tar.gz
description :
	 WebDriver <-> Marionette proxy
build_deps :
	 rust
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 dir = build.head? ? "testing/geckodriver" : "."
	 cd(dir) { system "cargo", "install", "--root", prefix, "--path", "." }
	 bin.install_symlink bin/"geckodriver" => "wires"
