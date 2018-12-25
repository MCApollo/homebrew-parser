name :
	 Chapel
homepage :
	 https://chapel-lang.org/
url :
	 https://github.com/chapel-lang/chapel/releases/download/1.18.0/chapel-1.18.0.tar.gz
description :
	 Emerging programming language designed for parallel computing
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 ENV["CHPL_HOME"] = libexec
	 ENV["CHPL_REGEXP"] = "re2"
	 cd libexec do
	 system "make"
	 system "make", "chpldoc"
	 system "make", "test-venv"
	 system "make", "mason"
	 system "make", "cleanall"
	 end
	 prefix.install_metafiles
	 bin.install Dir[libexec/"bin/darwin/*"]
	 bin.env_script_all_files libexec/"bin/darwin/", :CHPL_HOME => libexec
	 man1.install_symlink Dir["#{libexec}/man/man1/*.1"]
