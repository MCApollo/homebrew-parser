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
optional_deps :
conflicts :
resource :
	 ['Pillow', 'vasm', 'xcftools', 'vasm', 'xcftools']
	 ['https://files.pythonhosted.org/packages/8d/80/eca7a2d1a3c2dafb960f32f844d570de988e609f5fd17de92e1cf6a01b0a/Pillow-4.0.0.tar.gz', 'http://server.owl.de/~frank/tags/vasm1_7e.tar.gz', 'http://henning.makholm.net/xcftools/xcftools-1.0.7.tar.gz']
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", buildpath/"vendor/lib/python2.7/site-packages"
	 if MacOS.sdk_path_if_needed
	 ENV.append "CPPFLAGS", "-I#{MacOS.sdk_path}/System/Library/Frameworks/Tk.framework/Versions/8.5/Headers"
	 ENV.append "CPPFLAGS", "-I
	 end
	 resource("Pillow").stage do
	 inreplace "setup.py" do |s|
	 sdkprefix = MacOS.sdk_path_if_needed ? MacOS.sdk_path : ""
	 s.gsub! "ZLIB_ROOT = None", "ZLIB_ROOT = ('#{sdkprefix}/usr/lib', '#{sdkprefix}/usr/include')"
	 s.gsub! "JPEG_ROOT = None", "JPEG_ROOT = ('#{Formula["jpeg"].opt_prefix}/lib', '#{Formula["jpeg"].opt_prefix}/include')"
	 s.gsub! "FREETYPE_ROOT = None", "FREETYPE_ROOT = ('#{Formula["freetype"].opt_prefix}/lib', '#{Formula["freetype"].opt_prefix}/include')"
	 end
	 begin
	 saved_sdkroot = ENV.delete "SDKROOT"
	 ENV.append "CFLAGS", "-I#{MacOS.sdk_path}/System/Library/Frameworks/Tk.framework/Versions/8.5/Headers" unless MacOS::CLT.installed?
	 system "python", *Language::Python.setup_install_args(buildpath/"vendor")
	 ensure
	 ENV["SDKROOT"] = saved_sdkroot
	 end
