name :
	 Pgloader
homepage :
	 https://github.com/dimitri/pgloader
url :
	 https://github.com/dimitri/pgloader/archive/v3.5.2.tar.gz
description :
	 Data loading tool for PostgreSQL
build_deps :
	 buildapp
	 sphinx-doc
link_deps :
	 freetds
	 sbcl
	 postgresql
conflicts :
patches :
EOF_patch :
install :
	 resources.each do |resource|
	 resource.stage buildpath/"lib"/resource.name
