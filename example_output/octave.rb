name :
	 Octave
homepage :
	 https://www.gnu.org/software/octave/index.html
url :
	 https://ftp.gnu.org/gnu/octave/octave-4.4.1.tar.xz
description :
	 High-level interpreted language for numerical computing
build_deps :
	 gnu-sed
	 pkg-config
link_deps :
	 :java
	 arpack
	 epstool
	 fftw
	 fig2dev
	 fltk
	 fontconfig
	 freetype
	 gcc
	 ghostscript
	 gl2ps
	 glpk
	 gnuplot
	 graphicsmagick
	 hdf5
	 libsndfile
	 libtool
	 pcre
	 portaudio
	 pstoedit
	 qhull
	 qrupdate
	 readline
	 suite-sparse
	 sundials
	 texinfo
	 veclibfort
	 qt
conflicts :
patches :
EOF_patch :
install :
	 inreplace "src/mkoctfile.in.cc", /%OCTAVE_CONF_OCT(AVE)?_LINK_(DEPS|OPTS)%/, '""'
	 args = []
	 args << "--without-qt" if build.without? "qt"
	 system "./bootstrap" if build.head?
	 system "./configure", "--prefix=#{prefix}",
	 "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--enable-link-all-dependencies",
	 "--enable-shared",
	 "--disable-static",
	 "--without-osmesa",
	 "--with-hdf5-includedir=#{Formula["hdf5"].opt_include}",
	 "--with-hdf5-libdir=#{Formula["hdf5"].opt_lib}",
	 "--with-x=no",
	 "--with-blas=-L#{Formula["veclibfort"].opt_lib} -lvecLibFort",
	 "--with-portaudio",
	 "--with-sndfile",
	 *args
	 system "make", "all"
	 inreplace "src/mkoctfile.cc" do |s|
	 s.gsub! Formula["fftw"].prefix.realpath, Formula["fftw"].opt_prefix
	 s.gsub! Formula["gcc"].prefix.realpath, Formula["gcc"].opt_prefix
