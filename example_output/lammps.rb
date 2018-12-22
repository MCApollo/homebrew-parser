name :
	 Lammps
homepage :
	 https://lammps.sandia.gov/
url :
	 https://lammps.sandia.gov/tars/lammps-11Aug17.tar.gz
description :
	 Molecular Dynamics Simulator
build_deps :
link_deps :
	 fftw
	 gcc
	 jpeg
	 libpng
	 open-mpi
conflicts :
patches :
EOF_patch :
install :
	 %w[serial mpi].each do |variant|
	 cd "src" do
	 system "make", "clean-all"
	 system "make", "yes-standard"
	 %w[gpu kim kokkos mscg meam mpiio poems reax voronoi].each do |package|
	 system "make", "no-#{package}"
	 end
	 system "make", variant,
	 "LMP_INC=-DLAMMPS_GZIP",
	 "FFT_INC=-DFFT_FFTW3 -I#{Formula["fftw"].opt_include}",
	 "FFT_PATH=-L#{Formula["fftw"].opt_lib}",
	 "FFT_LIB=-lfftw3",
	 "JPG_INC=-DLAMMPS_JPEG -I#{Formula["jpeg"].opt_include} " \
	 "-DLAMMPS_PNG -I#{Formula["libpng"].opt_include}",
	 "JPG_PATH=-L#{Formula["jpeg"].opt_lib} -L#{Formula["libpng"].opt_lib}",
	 "JPG_LIB=-ljpeg -lpng"
	 bin.install "lmp_#{variant}"
	 end
	 end
	 pkgshare.install(%w[doc potentials tools bench examples])
