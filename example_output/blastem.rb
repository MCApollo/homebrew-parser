name :
	 Blastem
homepage :
	 https://www.retrodev.com/blastem/
url :
	 https://www.retrodev.com/repos/blastem/archive/3d48cb0c28be.tar.gz
description :
	 Fast and accurate Genesis emulator
build_deps :
	 freetype
	 jpeg
	 libpng
	 pkg-config
link_deps :
	 glew
	 python@2
	 sdl2
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", buildpath/"vendor/lib/python2.7/site-packages"
	 if MacOS.sdk_path_if_needed
	 ENV.append "CPPFLAGS", "-I#{MacOS.sdk_path}/System/Library/Frameworks/Tk.framework/Versions/8.5/Headers"
	 ENV.append "CPPFLAGS", "-I
