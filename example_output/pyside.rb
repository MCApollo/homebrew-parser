name :
	 Pyside
homepage :
	 https://wiki.qt.io/Qt_for_Python
url :
	 https://download.qt.io/official_releases/QtForPython/pyside2/PySide2-5.11.2-src/pyside-setup-everywhere-src-5.11.2.tar.xz
description :
	 Official Python bindings for Qt
build_deps :
link_deps :
	 cmake
	 llvm
	 python
	 python@2
	 qt
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = %W[
	 --ignore-git
	 --no-examples
	 --macos-use-libc++
	 --jobs=#{ENV.make_jobs}
	 --install-scripts #{bin}
	 ]
	 xy = Language::Python.major_minor_version "python3"
	 system "python3", *Language::Python.setup_install_args(prefix),
	 "--install-lib", lib/"python#{xy}/site-packages", *args
	 system "python2", *Language::Python.setup_install_args(prefix),
	 "--install-lib", lib/"python2.7/site-packages", *args
	 pkgshare.install "examples/samplebinding", "examples/utils"
