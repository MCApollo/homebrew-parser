name :
	 PdfRedactTools
homepage :
	 https://github.com/firstlookmedia/pdf-redact-tools
url :
	 https://github.com/firstlookmedia/pdf-redact-tools/archive/v0.1.2.tar.gz
description :
	 Securely redacting and stripping metadata
build_deps :
link_deps :
	 exiftool
	 ghostscript
	 imagemagick
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 system "python", *Language::Python.setup_install_args(libexec)
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
