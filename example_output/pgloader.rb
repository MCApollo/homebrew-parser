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
	 end
	 ENV["CL_SOURCE_REGISTRY"] = "#{buildpath}/lib//:#{buildpath}//"
	 ENV["ASDF_OUTPUT_TRANSLATIONS"] = "/:/"
	 system "make", "pgloader-standalone", "BUILDAPP=buildapp"
	 bin.install "build/bin/pgloader"
	 system "make", "-C", "docs", "man"
	 man1.install "docs/_build/man/pgloader.1"
