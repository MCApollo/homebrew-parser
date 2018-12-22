name :
	 Gromacs
homepage :
	 http://www.gromacs.org/
url :
	 https://ftp.gromacs.org/pub/gromacs/gromacs-2018.3.tar.gz
description :
	 Versatile package for molecular dynamics calculations
build_deps :
	 cmake
link_deps :
	 fftw
	 gsl
	 open-mpi
	 :x11
conflicts :
patches :
EOF_patch :
install :
	 args = std_cmake_args + %w[-DGMX_GSL=ON]
	 args << "-DGMX_DOUBLE=ON" if build.include? "enable-double"
	 args << "-DGMX_MPI=ON" if build.with? "mpi"
	 args << "-DGMX_X11=ON" if build.with? "x11"
	 inreplace "scripts/CMakeLists.txt", "CMAKE_INSTALL_BINDIR",
	 "CMAKE_INSTALL_DATADIR"
	 mkdir "build" do
	 system "cmake", "..", *args
	 system "make"
	 ENV.deparallelize { system "make", "install" }
	 end
	 bash_completion.install "build/scripts/GMXRC" => "gromacs-completion.bash"
	 bash_completion.install "#{bin}/gmx-completion-gmx.bash" => "gmx-completion-gmx.bash"
	 bash_completion.install "#{bin}/gmx-completion.bash" => "gmx-completion.bash"
	 zsh_completion.install "build/scripts/GMXRC.zsh" => "_gromacs"
