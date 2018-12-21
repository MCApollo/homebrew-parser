name :
	 Doitlive
homepage :
	 https://doitlive.readthedocs.io/en/latest/
url :
	 https://files.pythonhosted.org/packages/70/82/95e633a098a092a1230ce11ba3910d365bdfc3df8891651a85db6e49ceee/doitlive-4.2.0.tar.gz
description :
	 Replay stored shell commands for live presentations
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", "setup.py", "install", "--prefix=#{libexec}"
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
	 output = Utils.popen_read("SHELL=bash #{libexec}/bin/doitlive completion")
	 (bash_completion/"doitlive").write output
	 output = Utils.popen_read("SHELL=zsh #{libexec}/bin/doitlive completion")
	 (zsh_completion/"_doitlive").write output
