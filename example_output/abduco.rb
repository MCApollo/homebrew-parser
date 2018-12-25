name :
	 Abduco
homepage :
	 http://www.brain-dump.org/projects/abduco
url :
	 http://www.brain-dump.org/projects/abduco/abduco-0.6.tar.gz
description :
	 Provides session management: i.e. separate programs from terminals
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
	 ENV.append_to_cflags "-D_DARWIN_C_SOURCE"
	 system "make", "PREFIX=#{prefix}", "install"
