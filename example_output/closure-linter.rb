name :
	 ClosureLinter
homepage :
	 https://developers.google.com/closure/utilities/
url :
	 https://github.com/google/closure-linter/archive/v2.3.19.tar.gz
description :
	 Check JavaScript files for style and documentation
build_deps :
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV["PYTHONPATH"] = libexec+"lib/python2.7/site-packages"
	 resources.each do |r|
	 r.stage { system "python", *Language::Python.setup_install_args(libexec) }
