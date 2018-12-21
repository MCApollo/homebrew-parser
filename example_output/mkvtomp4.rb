name :
	 Mkvtomp4
homepage :
	 https://github.com/gavinbeatty/mkvtomp4/
url :
	 https://github.com/gavinbeatty/mkvtomp4/archive/mkvtomp4-v1.3.tar.gz
description :
	 Convert mkv files to mp4
build_deps :
link_deps :
	 ffmpeg
	 gpac
	 mkvtoolnix
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV["PYTHONPATH"] = lib+"python2.7/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", lib+"python2.7/site-packages"
	 system "make"
	 system "python", "setup.py", "install", "--prefix=#{prefix}"
	 bin.install "mkvtomp4.py" => "mkvtomp4"
	 bin.env_script_all_files(libexec+"bin", :PYTHONPATH => ENV["PYTHONPATH"])
