name :
	 Minisat
homepage :
	 http://minisat.se
url :
	 https://github.com/niklasso/minisat/archive/releases/2.2.0.tar.gz
description :
	 Boolean satisfiability (SAT) problem solver
build_deps :
link_deps :
	 gcc
conflicts :
patches :
	 https://github.com/niklasso/minisat/commit/9bd874980a7e5d65cecaba4edeb7127a41050ed1.patch?full_index=1
	 https://github.com/niklasso/minisat/commit/cfae87323839064832c8b3608bf595548dd1a1f3.patch?full_index=1
EOF_patch :
install :
	 ENV["MROOT"] = buildpath
	 system "make", "-C", "simp", "r"
	 bin.install "simp/minisat_release" => "minisat"
