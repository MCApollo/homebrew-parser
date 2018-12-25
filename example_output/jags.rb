name :
	 Jags
homepage :
	 https://mcmc-jags.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/mcmc-jags/JAGS/4.x/Source/JAGS-4.3.0.tar.gz
description :
	 Just Another Gibbs Sampler for Bayesian MCMC simulation
build_deps :
link_deps :
	 gcc
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
