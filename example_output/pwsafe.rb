name :
	 Pwsafe
homepage :
	 https://github.com/nsd20463/pwsafe
url :
	 https://src.fedoraproject.org/repo/pkgs/pwsafe/pwsafe-0.2.0.tar.gz/4bb36538a2772ecbf1a542bc7d4746c0/pwsafe-0.2.0.tar.gz
description :
	 Generate passwords and manage encrypted password databases
build_deps :
link_deps :
	 openssl
	 readline
conflicts :
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
