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
optional_deps :
conflicts :
resource :
	 ['G4NDL', 'G4EMLOW', 'PhotonEvaporation', 'RadioactiveDecay', 'G4SAIDDATA', 'G4NEUTRONXS', 'G4ABLA', 'G4PII', 'G4ENSDFSTATE']
	 ['https://cern.ch/geant4-data/datasets/G4NDL.4.5.tar.gz', 'https://cern.ch/geant4-data/datasets/G4EMLOW.7.3.tar.gz', 'https://cern.ch/geant4-data/datasets/G4PhotonEvaporation.5.2.tar.gz', 'https://cern.ch/geant4-data/datasets/G4RadioactiveDecay.5.2.tar.gz', 'https://cern.ch/geant4-data/datasets/G4SAIDDATA.1.1.tar.gz', 'https://cern.ch/geant4-data/datasets/G4NEUTRONXS.1.4.tar.gz', 'https://cern.ch/geant4-data/datasets/G4ABLA.3.1.tar.gz', 'https://cern.ch/geant4-data/datasets/G4PII.1.3.tar.gz', 'https://cern.ch/geant4-data/datasets/G4ENSDFSTATE.2.2.tar.gz']
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
	 end
	 resources.each do |r|
	 (share/"Geant4-#{version}/data/#{r.name}#{r.version}").install r
	 end
