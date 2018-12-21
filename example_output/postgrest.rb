name :
	 Postgrest
homepage :
	 https://github.com/PostgREST/postgrest
url :
	 https://github.com/PostgREST/postgrest/archive/v0.5.0.0.tar.gz
description :
	 Serves a fully RESTful API from any existing PostgreSQL database
build_deps :
	 cabal-install
	 ghc@8.2
link_deps :
	 postgresql
conflicts :
patches :
	 https://github.com/PostgREST/postgrest/pull/1111.patch?full_index=1
EOF_patch :
install :
	 install_cabal_package :using => ["happy"]
