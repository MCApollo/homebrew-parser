name :
	 PerconaXtrabackup
homepage :
	 https://www.percona.com/software/mysql-database/percona-xtrabackup
url :
	 https://www.percona.com/downloads/XtraBackup/Percona-XtraBackup-2.4.12/source/tarball/percona-xtrabackup-2.4.12.tar.gz
description :
	 Open source hot backup tool for InnoDB and XtraDB databases
build_deps :
	 cmake
	 sphinx-doc
link_deps :
	 libev
	 libgcrypt
	 mysql-client
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 cmake_args = %w[
	 -DBUILD_CONFIG=xtrabackup_release
	 -DCOMPILATION_COMMENT=Homebrew
	 -DINSTALL_MANDIR=share/man
	 -DWITH_MAN_PAGES=ON
	 ]
	 ENV["LC_ALL"] = "en_US.UTF-8"
	 (buildpath/"boost_1_59_0").install resource("boost")
	 cmake_args << "-DWITH_BOOST=#{buildpath}/boost_1_59_0"
	 cmake_args.concat std_cmake_args
	 system "cmake", *cmake_args
	 system "make"
	 system "make", "install"
	 share.install "share/man"
	 rm_rf prefix/"xtrabackup-test"
	 rm lib/"libmysqlservices.a"
	 rm lib/"plugin/keyring_file.so"
	 ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
	 if MacOS.version >= :mojave
	 resource("DBI").stage do
	 system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
	 system "make", "install"
	 end
