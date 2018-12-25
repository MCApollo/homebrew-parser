name :
	 Taisei
homepage :
	 https://taisei-project.org/
url :
	 https://github.com/taisei-project/taisei.git
description :
	 Clone of Touhou Project shoot-em-up games
build_deps :
	 freetype
	 libpng
	 libzip
	 meson
	 ninja
	 pkg-config
	 python
	 sdl2
	 sdl2_mixer
	 sdl2_ttf
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://github.com/taisei-project/taisei/commit/68b0d4f5c6f2015704e1ed1b4098be1c4336db74.patch?full_index=1
EOF_patch :
install :
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", "-Ddocs=false", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
