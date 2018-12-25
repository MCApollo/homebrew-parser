name :
	 Unp
homepage :
	 https://packages.debian.org/source/stable/unp
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/u/unp/unp_2.0~pre7+nmu1.tar.bz2
description :
	 Unpack everything with one command
build_deps :
link_deps :
	 p7zip
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.install %w[unp ucat]
	 man1.install "debian/unp.1"
	 bash_completion.install "bash_completion.d/unp"
	 %w[COPYING CHANGELOG].each { |f| rm f }
	 mv "debian/README.Debian", "README"
	 mv "debian/copyright", "COPYING"
	 mv "debian/changelog", "ChangeLog"
