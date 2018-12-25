name :
	 Opensubdiv
homepage :
	 https://graphics.pixar.com/opensubdiv/docs/intro.html
url :
	 https://github.com/PixarAnimationStudios/OpenSubdiv/archive/v3_3_3.tar.gz
description :
	 Open-source subdivision surface library
build_deps :
	 cmake
link_deps :
	 glfw
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 glfw = Formula["glfw"]
	 args = std_cmake_args + %W[
	 -DNO_CLEW=1
	 -DNO_CUDA=1
	 -DNO_DOC=1
	 -DNO_EXAMPLES=1
	 -DNO_OMP=1
	 -DNO_OPENCL=1
	 -DNO_PTEX=1
	 -DNO_TBB=1
	 -DGLFW_LOCATION=#{glfw.opt_prefix}
	 ]
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make"
	 system "make", "install"
	 pkgshare.install bin/"tutorials/hbr_tutorial_0"
	 rm_rf "#{bin}/tutorials"
	 end
