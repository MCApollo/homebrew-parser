name :
	 Iozone
homepage :
	 http://www.iozone.org/
url :
	 http://www.iozone.org/src/current/iozone3_482.tar
description :
	 File system benchmark tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "src/current" do
	 system "make", "macosx", "CC=#{ENV.cc}"
	 bin.install "iozone"
	 pkgshare.install %w[Generate_Graphs client_list gengnuplot.sh gnu3d.dem
	 gnuplot.dem gnuplotps.dem iozone_visualizer.pl
	 report.pl]
