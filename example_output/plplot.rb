name :
	 Plplot
homepage :
	 https://plplot.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/plplot/plplot/5.14.0%20Source/plplot-5.14.0.tar.gz
description :
	 Cross-platform software package for creating scientific plots
build_deps :
	 cmake
	 pkg-config
link_deps :
	 cairo
	 freetype
	 gcc
	 pango
optional_deps :
	 :java
	 :x11
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = std_cmake_args + %w[
	 -DPL_HAVE_QHULL=OFF
	 -DENABLE_ada=OFF
	 -DENABLE_d=OFF
	 -DENABLE_qt=OFF
	 -DENABLE_lua=OFF
	 -DENABLE_tk=OFF
	 -DENABLE_python=OFF
	 -DENABLE_tcl=OFF
	 -DPLD_xcairo=OFF
	 -DPLD_wxwidgets=OFF
	 -DENABLE_wxwidgets=OFF
	 -DENABLE_DYNDRIVERS=OFF
	 ]
	 args << "-DENABLE_java=OFF" if build.without? "java"
	 args << "-DPLD_xwin=OFF" if build.without? "x11"
	 mkdir "plplot-build" do
	 system "cmake", "..", *args
	 system "make"
	 system "make", "install"
	 end
	 cd (lib.to_s) do
	 Dir["*.dylib"].select { |f| File.ftype(f) == "file" }.each do |f|
	 MachO::Tools.dylibs(f).select { |d| d.start_with?("@rpath") }.each do |d|
	 d_new = d.sub("@rpath", opt_lib.to_s)
	 MachO::Tools.change_install_name(f, d, d_new)
	 end
	 end
	 end
