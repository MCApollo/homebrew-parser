name :
	 Unifdef
homepage :
	 https://dotat.at/prog/unifdef/
url :
	 https://dotat.at/prog/unifdef/unifdef-2.11.tar.gz
description :
	 Selectively process conditional C preprocessor directives
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
	 system "make", "prefix=#{prefix}", "install"
