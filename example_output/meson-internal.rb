name :
	 MesonInternal
homepage :
	 https://mesonbuild.com/
url :
	 https://github.com/mesonbuild/meson/releases/download/0.46.1/meson-0.46.1.tar.gz
description :
	 Fast and user friendly build system
build_deps :
link_deps :
	 ninja
	 python
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/a20d7df94112f93ea81f72ff3eacaa2d7e681053/meson-internal/meson-osx.patch?full_index=1
EOF_patch :
install :
	 virtualenv_install_with_resources
