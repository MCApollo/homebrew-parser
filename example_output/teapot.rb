name :
	 Teapot
homepage :
	 https://www.syntax-k.de/projekte/teapot/
url :
	 https://www.syntax-k.de/projekte/teapot/teapot-2.3.0.tar.gz
description :
	 Table editor and planner
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/config.h b/config.h
	 index 2a4e34f..cdf11a1 100644
	 --- a/config.h
	 +++ b/config.h
	 @@ -1,7 +1,7 @@
	 /* configuration values */
	 -#define VERSION "2.2.1"
	 +#define VERSION "2.3.0"
	 #define HELPFILE "/usr/local/share/doc/teapot/html/index.html"
install :
	 args = std_cmake_args + ["-DENABLE_HELP=OFF", ".."]
	 mkdir "macbuild" do
	 system "cmake", *args
	 system "make", "install"
