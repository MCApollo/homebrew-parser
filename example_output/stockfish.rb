name :
	 Stockfish
homepage :
	 https://stockfishchess.org/
url :
	 https://github.com/official-stockfish/Stockfish/files/2629649/sf_10.zip
description :
	 Strong open-source chess engine
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 if Hardware::CPU.features.include? :popcnt
	 arch = "x86-64-modern"
	 else
	 arch = Hardware::CPU.ppc? ? "ppc" : "x86"
	 arch += "-" + (MacOS.prefer_64_bit? ? "64" : "32")
	 end
	 system "make", "-C", "src", "build", "ARCH=#{arch}"
	 bin.install "src/stockfish"
