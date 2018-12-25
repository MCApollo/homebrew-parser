name :
	 Nwchem
homepage :
	 http://www.nwchem-sw.org
url :
	 https://github.com/nwchemgit/nwchem/releases/download/6.8.1-release/nwchem-6.8.1-release.revision-v6.8-133-ge032219-src.2018-06-14.tar.bz2
description :
	 NWChem: Open Source High-Performance Computational Chemistry
build_deps :
link_deps :
	 gcc
	 open-mpi
	 openblas
	 scalapack
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 pkgshare.install "QA"
	 cd "src" do
	 (prefix/"etc").mkdir
	 (prefix/"etc/nwchemrc").write <<~EOS
	 nwchem_basis_library #{pkgshare}/libraries/
	 nwchem_nwpw_library #{pkgshare}/libraryps/
	 ffield amber
	 amber_1 #{pkgshare}/amber_s/
	 amber_2 #{pkgshare}/amber_q/
	 amber_3 #{pkgshare}/amber_x/
	 amber_4 #{pkgshare}/amber_u/
	 spce    #{pkgshare}/solvents/spce.rst
	 charmm_s #{pkgshare}/charmm_s/
	 charmm_x #{pkgshare}/charmm_x/
	 EOS
	 inreplace "util/util_nwchemrc.F", "/etc/nwchemrc", "#{etc}/nwchemrc"
	 ENV["NWCHEM_TOP"] = buildpath
	 ENV["PYTHONVERSION"] = "2.7"
	 pyhome = `python-config --prefix`.chomp
	 ENV["PYTHONHOME"] = pyhome
	 ENV["NWCHEM_LONG_PATHS"] = "Y"
	 ENV["BLASOPT"] = "-L#{Formula["openblas"].opt_lib} -lopenblas"
	 ENV["BLAS_SIZE"] = "4"
	 ENV["SCALAPACK"] = "-L#{Formula["scalapack"].opt_prefix}/lib -lscalapack"
	 ENV["USE_64TO32"] = "y"
	 system "make", "nwchem_config", "NWCHEM_MODULES=all python"
	 system "make", "64_to_32"
	 system "make", "NWCHEM_TARGET=MACX64", "USE_MPI=Y"
	 bin.install "../bin/MACX64/nwchem"
	 pkgshare.install "basis/libraries"
	 pkgshare.install "nwpw/libraryps"
	 pkgshare.install Dir["data/*"]
	 end
