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
