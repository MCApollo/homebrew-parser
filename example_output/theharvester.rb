name :
	 Theharvester
homepage :
	 http://www.edge-security.com/theharvester.php
url :
	 https://github.com/laramies/theHarvester/archive/v3.0.1.tar.gz
description :
	 Gather materials from public sources (for pen testers)
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 ['requests']
	 ['https://files.pythonhosted.org/packages/49/6f/183063f01aae1e025cf0130772b55848750a2f3a89bfa11b385b35d7329d/requests-2.10.0.tar.gz']
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
	 libexec.install Dir["*"]
	 (libexec/"theHarvester.py").chmod 0755
	 (bin/"theharvester").write_env_script("#{libexec}/theHarvester.py", :PYTHONPATH => ENV["PYTHONPATH"])
