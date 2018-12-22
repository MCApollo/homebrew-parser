name :
	 ClozureCl
homepage :
	 https://ccl.clozure.com
url :
	 https://github.com/Clozure/ccl/archive/v1.11.5.tar.gz
description :
	 Common Lisp implementation with a long history
build_deps :
	 :xcode
link_deps :
conflicts :
	 cclive
patches :
EOF_patch :
install :
	 tmpdir = Pathname.new(Dir.mktmpdir)
	 tmpdir.install resource("bootstrap")
	 buildpath.install tmpdir/"dx86cl64.image"
	 buildpath.install tmpdir/"darwin-x86-headers64"
	 cd "lisp-kernel/darwinx8664" do
	 system "make"
	 end
	 ENV["CCL_DEFAULT_DIRECTORY"] = buildpath
	 system "./dx86cl64", "-n", "-l", "lib/x8664env.lisp",
	 "-e", "(ccl:xload-level-0)",
	 "-e", "(ccl:compile-ccl)",
	 "-e", "(quit)"
	 system "echo \"(ccl:save-application \\\"dx86cl64.image\\\")\\n(quit)\" | ./dx86cl64 -n --image-name x86-boot64.image"
	 prefix.install "doc/README"
	 doc.install Dir["doc/*"]
	 libexec.install Dir["*"]
	 bin.install Dir["#{libexec}/scripts/ccl64"]
	 bin.env_script_all_files(libexec/"bin", :CCL_DEFAULT_DIRECTORY => libexec)
