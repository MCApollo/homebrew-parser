name :
	 Ledger
homepage :
	 https://ledger-cli.org/
url :
	 https://github.com/ledger/ledger/archive/v3.1.1.tar.gz
description :
	 Command-line, double-entry accounting tool
build_deps :
	 cmake
link_deps :
	 boost
	 boost-python
	 gmp
	 mpfr
	 python@2
conflicts :
patches :
	 https://github.com/ledger/ledger/commit/c18a55f9.diff?full_index=1
EOF_patch :
install :
	 ENV.cxx11
	 inreplace "CMakeLists.txt", "set(BOOST_PYTHON python)",
	 "set(BOOST_PYTHON python27)"
	 args = %W[
	 --jobs=#{ENV.make_jobs}
	 --output=build
	 --prefix=#{prefix}
	 --boost=#{Formula["boost"].opt_prefix}
	 --python
	 --
	 -DBUILD_DOCS=1
	 -DBUILD_WEB_DOCS=1
	 ]
	 system "./acprep", "opt", "make", *args
	 system "./acprep", "opt", "make", "doc", *args
	 system "./acprep", "opt", "make", "install", *args
	 (pkgshare/"examples").install Dir["test/input/*.dat"]
	 pkgshare.install "contrib"
	 pkgshare.install "python/demo.py"
	 elisp.install Dir["lisp/*.el", "lisp/*.elc"]
	 bash_completion.install pkgshare/"contrib/ledger-completion.bash"
