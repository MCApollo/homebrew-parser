name :
	 Cp2k
homepage :
	 https://www.cp2k.org/
url :
	 https://github.com/cp2k/cp2k/releases/download/v5.1.0/cp2k-5.1.tar.bz2
description :
	 Quantum chemistry and solid state physics software package
build_deps :
link_deps :
	 fftw
	 gcc
	 libxc
	 open-mpi
	 scalapack
conflicts :
patches :
EOF_patch :
install :
	 resource("libint").stage do
	 system "./configure", "--prefix=#{libexec}"
	 system "make"
	 ENV.deparallelize { system "make", "install" }
	 end
	 fcflags = %W[
	 -I#{Formula["libxc"].opt_include}
	 -I#{Formula["fftw"].opt_include}
	 -I#{libexec}/include
	 ]
	 libs = %W[
	 -L#{Formula["libxc"].opt_lib}
	 -lxcf90
	 -lxc
	 -L#{libexec}/lib
	 -lderiv
	 -lint
	 -L#{Formula["fftw"].opt_lib}
	 -lfftw3
	 ]
	 inreplace Dir["arch/Darwin-IntelMacintosh-gfortran.*"].each do |s|
	 s.gsub! /DFLAGS *=/, "DFLAGS = -D__LIBXC -D__FFTW3 -D__LIBINT"
	 s.gsub! /FCFLAGS *=/, "FCFLAGS = #{fcflags.join(" ")}"
	 s.gsub! /LIBS *=/, "LIBS = #{libs.join(" ")}"
	 end
	 inreplace Dir["arch/Darwin-IntelMacintosh-gfortran.p*"],
	 /LIBS *=/, "LIBS = -L#{Formula["scalapack"].opt_prefix}/lib"
	 inreplace Dir["arch/Darwin-IntelMacintosh-gfortran.*smp"],
	 "-lfftw3", "-lfftw3 -lfftw3_threads"
	 cd "makefiles" do
	 %w[sopt ssmp popt psmp].each do |exe|
	 system "make", "ARCH=Darwin-IntelMacintosh-gfortran", "VERSION=#{exe}"
	 bin.install "../exe/Darwin-IntelMacintosh-gfortran/cp2k.#{exe}"
	 bin.install "../exe/Darwin-IntelMacintosh-gfortran/cp2k_shell.#{exe}"
	 end
	 end
	 (pkgshare/"tests").install "tests/Fist/water512.inp"
