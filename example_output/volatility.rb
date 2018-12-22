name :
	 Volatility
homepage :
	 https://github.com/volatilityfoundation/volatility
url :
	 https://downloads.volatilityfoundation.org/releases/2.6/volatility-2.6.zip
description :
	 Advanced memory forensics framework
build_deps :
link_deps :
	 freetype
	 jpeg
	 python@2
	 yara
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec)
	 resource("Pillow").stage do
	 inreplace "setup.py" do |s|
	 sdkprefix = MacOS.sdk_path_if_needed ? MacOS.sdk_path : ""
	 s.gsub! "openjpeg.h", "probably_not_a_header_called_this_eh.h"
	 s.gsub! "ZLIB_ROOT = None", "ZLIB_ROOT = ('#{sdkprefix}/usr/lib', '#{sdkprefix}/usr/include')"
	 s.gsub! "JPEG_ROOT = None",
	 "JPEG_ROOT = ('#{Formula["jpeg"].opt_prefix}/lib', " \
	 "'#{Formula["jpeg"].opt_prefix}/include')"
	 s.gsub! "FREETYPE_ROOT = None",
	 "FREETYPE_ROOT = ('#{Formula["freetype"].opt_prefix}/lib', " \
	 "'#{Formula["freetype"].opt_prefix}/include')"
	 end
	 begin
	 deleted = ENV.delete "SDKROOT"
	 unless MacOS::CLT.installed?
	 ENV.append "CFLAGS", "-I#{MacOS.sdk_path}/System/Library/Frameworks/Tk.framework/Versions/8.5/Headers"
	 end
	 venv.pip_install Pathname.pwd
	 ensure
	 ENV["SDKROOT"] = deleted
	 end
