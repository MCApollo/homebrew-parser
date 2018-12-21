name :
	 Xsd
homepage :
	 https://www.codesynthesis.com/products/xsd/
url :
	 https://www.codesynthesis.com/download/xsd/4.0/xsd-4.0.0+dep.tar.bz2
description :
	 XML Data Binding for C++
build_deps :
	 pkg-config
link_deps :
	 xerces-c
conflicts :
	 mono
patches :
EOF_patch :
	 diff --git a/libxsd-frontend/xsd-frontend/semantic-graph/elements.cxx b/libxsd-frontend/xsd-frontend/semantic-graph/elements.cxx
	 index fa48a9a..59994ae 100644
	 --- a/libxsd-frontend/xsd-frontend/semantic-graph/elements.cxx
	 +++ b/libxsd-frontend/xsd-frontend/semantic-graph/elements.cxx
	 @@ -2,6 +2,7 @@
	 // copyright : Copyright (c) 2005-2014 Code Synthesis Tools CC
	 // license   : GNU GPL v2 + exceptions; see accompanying LICENSE file
	 +#include <iostream>
	 #include <algorithm>
	 #include <cutl/compiler/type-info.hxx>
	 diff --git a/xsd/examples/cxx/tree/makefile b/xsd/examples/cxx/tree/makefile
	 index 172195a..d8c8198 100644
	 --- a/xsd/examples/cxx/tree/makefile
	 +++ b/xsd/examples/cxx/tree/makefile
	 @@ -39,7 +39,7 @@ $(install): $(addprefix $(out_base)/,$(addsuffix /.install,$(all_examples)))
	 $(dist): $(addprefix $(out_base)/,$(addsuffix /.dist,$(all_examples)))
	 $(call install-data,$(src_base)/README,$(dist_prefix)/$(path)/README)
	 -$(dist-win): export dirs := $(shell find $(src_base) -type d -exec test -f {}/driver.cxx ';' -printf '%P ')
	 +$(dist-win): export dirs := $(shell find "$(src_base)" -type d -exec test -f {}/driver.cxx ';' -exec bash -c 'd="{}"; printf "%s " "${d#'"$(src_base)"'/}"' ";")
	 $(dist-win): |$(out_root)/.dist-pre
	 $(dist-win): $(addprefix $(out_base)/,$(addsuffix /.dist-win,$(all_examples)))
	 $(call install-data,$(src_base)/README,$(dist_prefix)/$(path)/README.txt)
install :
	 ENV.append "LDFLAGS", `pkg-config --libs --static xerces-c`.chomp
	 ENV.cxx11
	 system "make", "install", "install_prefix=#{prefix}"
