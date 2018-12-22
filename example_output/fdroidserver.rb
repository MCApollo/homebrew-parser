name :
	 Fdroidserver
homepage :
	 https://f-droid.org
url :
	 https://files.pythonhosted.org/packages/74/54/dc4be6eba84682eda5ac72f430aeefa44d52e03665567eab59c0adc7c68f/fdroidserver-1.0.9.tar.gz
description :
	 Create and manage Android app repositories for F-Droid
build_deps :
	 pkg-config
link_deps :
	 freetype
	 jpeg
	 libtiff
	 openssl
	 python
	 s3cmd
	 webp
conflicts :
patches :
EOF_patch :
install :
	 bash_completion.install "completion/bash-completion" => "fdroid"
	 venv = virtualenv_create(libexec, "python3")
	 resource("Pillow").stage do
	 inreplace "setup.py" do |s|
	 sdkprefix = MacOS::CLT.installed? ? "" : MacOS.sdk_path
	 s.gsub! "openjpeg.h", "probably_not_a_header_called_this_eh.h"
	 s.gsub! "ZLIB_ROOT = None", "ZLIB_ROOT = ('#{sdkprefix}/usr/lib', '#{sdkprefix}/usr/include')"
	 s.gsub! "JPEG_ROOT = None", "JPEG_ROOT = ('#{Formula["jpeg"].opt_prefix}/lib', '#{Formula["jpeg"].opt_prefix}/include')"
	 s.gsub! "FREETYPE_ROOT = None", "FREETYPE_ROOT = ('#{Formula["freetype"].opt_prefix}/lib', '#{Formula["freetype"].opt_prefix}/include')"
	 end
	 ENV.delete "SDKROOT"
	 ENV.append "CFLAGS", "-I#{MacOS.sdk_path}/System/Library/Frameworks/Tk.framework/Versions/8.5/Headers" unless MacOS::CLT.installed?
	 venv.pip_install Pathname.pwd
	 end
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 venv.pip_install resource("lxml")
	 ENV.delete "SDKROOT"
	 venv.pip_install resource("cffi")
	 res = resources.map(&:name).to_set - ["cffi", "lxml", "Pillow"]
	 res.each do |r|
	 venv.pip_install resource(r)
	 end
	 venv.pip_install_and_link buildpath
	 doc.install "examples"