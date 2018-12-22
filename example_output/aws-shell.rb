name :
	 AwsShell
homepage :
	 https://github.com/awslabs/aws-shell
url :
	 https://files.pythonhosted.org/packages/46/5a/c01bbff96fcbe8051e0b59e6191e07f5917f7f2cf667557c7dcbb85f62c3/aws-shell-0.2.1.tar.gz
description :
	 Integrated shell for working with the AWS CLI
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV["PYTHONPATH"] = libexec/"lib/python#{xy}/site-packages"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 env = {
	 :PATH       => "#{libexec}/vendor/bin:$PATH",
	 :PYTHONPATH => ENV["PYTHONPATH"],
	 }
	 bin.env_script_all_files(libexec/"bin", env)
