name :
	 Ninja
homepage :
	 https://ninja-build.org/
url :
	 https://github.com/ninja-build/ninja/archive/v1.8.2.tar.gz
description :
	 Small build system for use with gyp or CMake
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
	 system "python", "configure.py", "--bootstrap"
	 system "./configure.py"
	 system "./ninja", "ninja_test"
	 system "./ninja_test", "--gtest_filter=-SubprocessTest.SetWithLots"
	 bin.install "ninja"
	 bash_completion.install "misc/bash-completion" => "ninja-completion.sh"
	 zsh_completion.install "misc/zsh-completion" => "_ninja"
