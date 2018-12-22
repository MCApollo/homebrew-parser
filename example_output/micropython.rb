name :
	 Micropython
homepage :
	 https://www.micropython.org/
url :
	 https://github.com/micropython/micropython.git
description :
	 Python implementation for microcontrollers and constrained systems
build_deps :
	 pkg-config
link_deps :
	 libffi
conflicts :
patches :
EOF_patch :
install :
	 cd "ports/unix" do
	 system "make", "axtls"
	 system "make", "install", "PREFIX=#{prefix}"
	 end
	 cd "mpy-cross" do
	 system "make"
	 bin.install "mpy-cross"
	 end
