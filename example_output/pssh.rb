name :
	 Pssh
homepage :
	 https://code.google.com/archive/p/parallel-ssh/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/parallel-ssh/pssh-2.3.1.tar.gz
description :
	 Parallel versions of OpenSSH and related tools
build_deps :
link_deps :
	 python@2
optional_deps :
conflicts :
	 putty
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["PYTHONPATH"] = lib/"python2.7/site-packages"
	 system "python", "setup.py", "install", "--prefix=#{prefix}",
	 "--install-data=#{share}"
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
