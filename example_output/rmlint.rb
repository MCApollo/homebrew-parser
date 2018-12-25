name :
	 Rmlint
homepage :
	 https://github.com/sahib/rmlint
url :
	 https://github.com/sahib/rmlint/archive/v2.8.0.tar.gz
description :
	 Extremely fast tool to remove dupes and other lint from your filesystem
build_deps :
	 gettext
	 pkg-config
	 scons
	 sphinx-doc
link_deps :
	 glib
	 json-glib
	 libelf
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 scons "config"
	 scons
	 bin.install "rmlint"
	 man1.install "docs/rmlint.1.gz"
