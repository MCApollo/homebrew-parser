name :
	 Clhep
homepage :
	 https://proj-clhep.web.cern.ch/proj-clhep/
url :
	 https://proj-clhep.web.cern.ch/proj-clhep/DISTRIBUTION/tarFiles/clhep-2.4.1.0.tgz
description :
	 Class Library for High Energy Physics
build_deps :
	 cmake
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 mv (buildpath/"CLHEP").children, buildpath if build.stable?
	 mkdir "build" do
	 system "cmake", "..", *std_cmake_args
	 system "make", "install"
	 end
