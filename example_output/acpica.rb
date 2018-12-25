name :
	 Acpica
homepage :
	 https://www.acpica.org/
url :
	 https://acpica.org/sites/acpica/files/acpica-unix-20180810.tar.gz
description :
	 OS-independent implementation of the ACPI specification
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
	 ENV.deparallelize
	 system "make", "PREFIX=#{prefix}"
	 system "make", "install", "PREFIX=#{prefix}"
