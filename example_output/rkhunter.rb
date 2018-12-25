name :
	 Rkhunter
homepage :
	 https://rkhunter.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/rkhunter/rkhunter/1.4.6/rkhunter-1.4.6.tar.gz
description :
	 Rootkit hunter
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./installer.sh", "--layout", "custom", prefix, "--install"
