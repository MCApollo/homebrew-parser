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
optional_deps :
conflicts :
resource :
	 ['Mako', 'gears.c']
	 ['https://files.pythonhosted.org/packages/eb/f3/67579bb486517c0d49547f9697e36582cd19dafb5df9e687ed8e22de57fa/Mako-1.0.7.tar.gz', 'https://www.opengl.org/archives/resources/code/samples/glut_examples/mesademos/gears.c']
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
