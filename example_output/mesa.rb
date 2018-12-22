name :
	 Mesa
homepage :
	 https://www.mesa3d.org/
url :
	 https://mesa.freedesktop.org/archive/mesa-18.3.1.tar.xz
description :
	 Graphics Library
build_deps :
	 meson-internal
	 ninja
	 pkg-config
	 python@2
link_deps :
	 freeglut
	 expat
	 gettext
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", buildpath/"vendor/lib/python2.7/site-packages"
	 resource("Mako").stage do
	 system "python", *Language::Python.setup_install_args(buildpath/"vendor")
	 end
	 resource("gears.c").stage(pkgshare.to_s)
	 mkdir "build" do
	 system "meson", "--prefix=#{prefix}", "-D buildtype=plain", "-D b_ndebug=true", ".."
	 system "ninja"
	 system "ninja", "install"
	 end
