name :
	 Mat2
homepage :
	 https://0xacab.org/jvoisin/mat2
url :
	 https://0xacab.org/jvoisin/mat2/uploads/e958dde527c7255e94ae2b347086ba9f/mat-0.6.0.tar.xz
description :
	 Metadata anonymization toolkit
build_deps :
link_deps :
	 exiftool
	 ffmpeg
	 poppler
	 py3cairo
	 pygobject3
	 python
optional_deps :
conflicts :
resource :
	 ['mutagen']
	 ['https://files.pythonhosted.org/packages/source/m/mutagen/mutagen-1.41.1.tar.gz']
patches :
EOF_patch :
	 diff --git a/mat2 b/mat2
	 index ff8a253..151cbf6 100755
	 --- a/mat2
	 +++ b/mat2
	 @@ -133,7 +133,7 @@ def show_parsers() -> bool:
	 continue
	 formats.add('  - %s (%s)' % (mtype, ', '.join(extensions)))
	 print('\n'.join(sorted(formats)))
	 -    return True
	 +    return 0
install :
	 inreplace "libmat2/exiftool.py", "/usr/bin/exiftool", "#{HOMEBREW_PREFIX}/bin/exiftool"
	 inreplace "libmat2/video.py", "/usr/bin/ffmpeg", "#{HOMEBREW_PREFIX}/bin/ffmpeg"
	 version = Language::Python.major_minor_version("python3")
	 pygobject3 = Formula["pygobject3"]
	 ENV["PYTHONPATH"] = lib/"python#{version}/site-packages"
	 ENV.append_path "PYTHONPATH", pygobject3.opt_lib+"python#{version}/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{version}/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 system "python3", *Language::Python.setup_install_args(prefix)
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
