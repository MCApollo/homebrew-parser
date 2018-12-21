name :
	 Archivemail
homepage :
	 https://archivemail.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/archivemail/archivemail-0.9.0.tar.gz
description :
	 Tool for archiving and compressing old email in mailboxes
build_deps :
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 system "python", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
	 man1.install Dir[libexec/"share/man/man1/*"]
