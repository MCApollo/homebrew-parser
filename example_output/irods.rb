name :
	 Irods
homepage :
	 https://irods.org/
url :
	 https://github.com/irods/irods-legacy/archive/3.3.1.tar.gz
description :
	 Integrated data grid software solution
build_deps :
link_deps :
	 openssl
conflicts :
	 sleuthkit
	 renameutils
patches :
EOF_patch :
install :
	 cd "iRODS" do
	 system "./scripts/configure"
	 inreplace "config/config.mk", "
	 inreplace "config/config.mk", "
	 system "make"
	 bin.install Dir["clients/icommands/bin/*"].select { |f| File.executable? f }
