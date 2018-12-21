name :
	 Scrcpy
homepage :
	 https://github.com/Genymobile/scrcpy
url :
	 https://github.com/Genymobile/scrcpy/archive/v1.5.tar.gz
description :
	 Display and control your Android device
build_deps :
	 meson
	 ninja
	 pkg-config
link_deps :
	 ffmpeg
	 sdl2
conflicts :
patches :
EOF_patch :
install :
	 r = resource("prebuilt-server")
	 r.verify_download_integrity(r.fetch)
	 cp r.cached_download, buildpath/"prebuilt-server.jar"
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}",
	 "--buildtype=release",
	 "-Dprebuilt_server=#{buildpath}/prebuilt-server.jar",
	 ".."
	 system "ninja", "install"
