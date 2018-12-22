name :
	 OsspUuid
homepage :
	 https://web.archive.org/web/www.ossp.org/pkg/lib/uuid/
url :
	 https://mirrors.ocf.berkeley.edu/debian/pool/main/o/ossp-uuid/ossp-uuid_1.6.2.orig.tar.gz
description :
	 ISO-C API and CLI for generating UUIDs
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 inreplace "uuid.pc.in" do |s|
	 s.gsub! /^(exec_prefix)=\$\{prefix\}$/, '\1=@\1@'
	 s.gsub! %r{^(includedir)=\$\{prefix\}/include$}, '\1=@\1@'
	 s.gsub! %r{^(libdir)=\$\{exec_prefix\}/lib$}, '\1=@\1@'
	 end
	 system "./configure", "--prefix=#{prefix}",
	 "--includedir=#{include}/ossp",
	 "--without-perl",
	 "--without-php",
	 "--without-pgsql"
	 system "make"
	 system "make", "install"
