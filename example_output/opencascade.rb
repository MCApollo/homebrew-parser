name :
	 Opencascade
homepage :
	 https://www.opencascade.com/content/overview
url :
	 https://git.dev.opencascade.org/gitweb/?p=occt.git;a=snapshot;h=refs/tags/V7_3_0;sf=tgz
description :
	 3D modeling and numerical simulation software for CAD/CAM/CAE
build_deps :
	 cmake
	 doxygen
link_deps :
	 freeimage
	 freetype
	 gl2ps
	 tbb
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "cmake", ".",
	 "-DUSE_FREEIMAGE=ON",
	 "-DUSE_GL2PS=ON",
	 "-DUSE_TBB=ON",
	 "-DINSTALL_DOC_Overview=ON",
	 "-D3RDPARTY_FREEIMAGE_DIR=#{Formula["freeimage"].opt_prefix}",
	 "-D3RDPARTY_FREETYPE_DIR=#{Formula["freetype"].opt_prefix}",
	 "-D3RDPARTY_GL2PS_DIR=#{Formula["gl2ps"].opt_prefix}",
	 "-D3RDPARTY_TBB_DIR=#{Formula["tbb"].opt_prefix}",
	 "-D3RDPARTY_TCL_DIR:PATH=#{MacOS.sdk_path_if_needed}/usr",
	 "-D3RDPARTY_TCL_INCLUDE_DIR=#{MacOS.sdk_path_if_needed}/usr/include",
	 "-D3RDPARTY_TK_INCLUDE_DIR=#{MacOS.sdk_path_if_needed}/usr/include",
	 *std_cmake_args
	 system "make", "install"
	 bin.env_script_all_files(libexec/"bin", :CASROOT => prefix)
	 prefix.install_symlink pkgshare/"resources" => "src"
