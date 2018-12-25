name :
	 Elektra
homepage :
	 https://libelektra.org/
url :
	 https://www.libelektra.org/ftp/elektra/releases/elektra-0.8.25.tar.gz
description :
	 Framework to access config settings in a global key database
build_deps :
	 cmake
	 doxygen
link_deps :
	 discount
optional_deps :
	 qt
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 tools = "kdb;"
	 tools << "qt-gui;" if build.with? "qt"
	 mkdir "build" do
	 system "cmake", "..", "-DBINDINGS=cpp", "-DTOOLS=#{tools}",
	 "-DPLUGINS=NODEP", *std_cmake_args
	 system "make", "install"
	 end
	 bash_completion.install "scripts/kdb-bash-completion" => "kdb"
	 fish_completion.install "scripts/kdb.fish"
	 zsh_completion.install "scripts/kdb_zsh_completion" => "_kdb"
