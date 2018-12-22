name :
	 Weboob
homepage :
	 http://weboob.org/
url :
	 https://symlink.me/attachments/download/356/weboob-1.3.tar.gz
description :
	 Web Outside of Browsers
build_deps :
link_deps :
	 freetype
	 gnupg
	 jpeg
	 libyaml
	 python@2
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
	 s.gsub! "JPEG_ROOT = None", "JPEG_ROOT = ('#{Formula["jpeg"].opt_prefix}/lib', '#{Formula["jpeg"].opt_prefix}/include')"
	 s.gsub! "FREETYPE_ROOT = None", "FREETYPE_ROOT = ('#{Formula["freetype"].opt_prefix}/lib', '#{Formula["freetype"].opt_prefix}/include')"
	 end
	 ENV.append "CFLAGS", "-I#{MacOS.sdk_path}/System/Library/Frameworks/Tk.framework/Versions/8.5/Headers" unless MacOS::CLT.installed?
	 venv.pip_install Pathname.pwd
	 end
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 res = resources.map(&:name).to_set - ["Pillow"]
	 res.each do |r|
	 venv.pip_install resource(r)
	 end
	 venv.pip_install_and_link buildpath
