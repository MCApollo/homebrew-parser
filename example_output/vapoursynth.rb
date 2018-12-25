name :
	 Vapoursynth
homepage :
	 http://www.vapoursynth.com
url :
	 https://github.com/vapoursynth/vapoursynth/archive/R45.1.tar.gz
description :
	 Video processing framework with simplicity in mind
build_deps :
	 autoconf
	 automake
	 libtool
	 nasm
	 pkg-config
link_deps :
	 libass
	 :macos
	 python
	 tesseract
	 zimg
optional_deps :
conflicts :
resource :
	 ['Cython']
	 ['https://files.pythonhosted.org/packages/f0/66/6309291b19b498b672817bd237caec787d1b18013ee659f17b1ec5844887/Cython-0.29.tar.gz']
patches :
EOF_patch :
install :
	 venv = virtualenv_create(buildpath/"cython", "python3")
	 venv.pip_install "Cython"
	 system "./autogen.sh"
	 system "./configure", "--prefix=#{prefix}",
	 "--with-cython=#{buildpath}/cython/bin/cython"
	 system "make", "install"
