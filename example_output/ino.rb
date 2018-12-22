name :
	 Ino
homepage :
	 http://inotool.org
url :
	 https://files.pythonhosted.org/packages/source/i/ino/ino-0.3.6.tar.gz
description :
	 Command-line toolkit for working with Arduino hardware
build_deps :
link_deps :
	 picocom
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV["PYTHONPATH"] = lib+"python2.7/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", libexec+"lib/python2.7/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", prefix+"lib/python2.7/site-packages"
	 resources.each do |r|
	 r.stage { system "python", "setup.py", "install", "--prefix=#{libexec}" }
	 end
	 system "python", "setup.py", "install", "--prefix=#{prefix}"
	 rm Dir["#{lib}/python2.7/site-packages/*.pth"]
	 bin.env_script_all_files(libexec+"bin", :PYTHONPATH => ENV["PYTHONPATH"])
