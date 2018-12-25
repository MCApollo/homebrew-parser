name :
	 Spim
homepage :
	 https://spimsimulator.sourceforge.io/
url :
	 http://svn.code.sf.net/p/spimsimulator/code
description :
	 MIPS32 simulator
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
	 bin.mkpath
	 cd "spim" do
	 system "make", "EXCEPTION_DIR=#{share}"
	 system "make", "test"
	 system "make", "install", "BIN_DIR=#{bin}",
	 "EXCEPTION_DIR=#{share}",
	 "MAN_DIR=#{man1}"
	 end
