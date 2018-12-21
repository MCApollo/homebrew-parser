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
