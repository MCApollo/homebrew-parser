name :
	 PhoronixTestSuite
homepage :
	 https://www.phoronix-test-suite.com/
url :
	 https://github.com/phoronix-test-suite/phoronix-test-suite/archive/v8.4.1.tar.gz
description :
	 Open-source automated testing/benchmarking software
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 rm_rf [prefix/"../etc", prefix/"../usr"]
