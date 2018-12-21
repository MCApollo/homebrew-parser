name :
	 Pcb2gcode
homepage :
	 https://github.com/pcb2gcode/pcb2gcode
url :
	 https://github.com/pcb2gcode/pcb2gcode/releases/download/v1.3.2/pcb2gcode-1.3.2.tar.gz
description :
	 Command-line tool for isolation, routing and drilling of PCBs
build_deps :
	 pkg-config
link_deps :
	 gerbv
	 gtkmm
conflicts :
patches :
EOF_patch :
install :
	 resource("boost").stage do
	 open("user-config.jam", "a") do |file|
	 file.write "using darwin : : #{ENV.cxx} ;\n"
