name :
	 Namebench
homepage :
	 https://code.google.com/archive/p/namebench/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/namebench/namebench-1.3.1-source.tgz
description :
	 DNS benchmark utility
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python2.7/site-packages"
	 system "python", "setup.py", "install", "--prefix=#{libexec}",
	 "--install-data=#{libexec}/lib/python2.7/site-packages"
	 bin.install "namebench.py" => "namebench"
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
