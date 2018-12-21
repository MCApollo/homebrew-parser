name :
	 GitIntegration
homepage :
	 https://johnkeeping.github.io/git-integration/
url :
	 https://github.com/johnkeeping/git-integration/archive/v0.4.tar.gz
description :
	 Manage git integration branches
build_deps :
link_deps :
	 asciidoc
conflicts :
patches :
EOF_patch :
install :
	 ENV["XML_CATALOG_FILES"] = "#{etc}/xml/catalog"
	 (buildpath/"config.mak").write "prefix = #{prefix}"
	 system "make", "install"
	 system "make", "install-doc" if build.with? "asciidoc"
	 system "make", "install-completion"
