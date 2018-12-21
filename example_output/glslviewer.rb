name :
	 Glslviewer
homepage :
	 http://patriciogonzalezvivo.com/2015/glslViewer/
url :
	 https://github.com/patriciogonzalezvivo/glslViewer/archive/1.5.5.tar.gz
description :
	 Live-coding console tool that renders GLSL Shaders
build_deps :
	 pkg-config
link_deps :
	 glfw
conflicts :
patches :
EOF_patch :
install :
	 system "make"
	 bin.install Dir["bin/*"]
