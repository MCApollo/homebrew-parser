name :
	 Geant4
homepage :
	 https://geant4.web.cern.ch
url :
	 https://geant4-data.web.cern.ch/geant4-data/releases/source/geant4.10.04.p02.tar.gz
description :
	 Simulation toolkit for particle transport through matter
build_deps :
link_deps :
	 cmake
	 qt
	 xerces-c
conflicts :
patches :
EOF_patch :
install :
	 mkdir "geant-build" do
	 args = std_cmake_args + %w[
	 ../
	 -DGEANT4_USE_GDML=ON
	 -DGEANT4_BUILD_MULTITHREADED=ON
	 -DGEANT4_USE_QT=ON
	 ]
	 system "cmake", *args
	 system "make", "install"
