name :
	 Tree
homepage :
	 http://mama.indstate.edu/users/ice/tree/
url :
	 http://mama.indstate.edu/users/ice/tree/src/tree-1.8.0.tgz
description :
	 Display directories as trees (with optional color/HTML output)
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
	 ENV.append "CFLAGS", "-fomit-frame-pointer"
	 objs = "tree.o unix.o html.o xml.o json.o hash.o color.o file.o strverscmp.o"
	 system "make", "prefix=#{prefix}",
	 "MANDIR=#{man1}",
	 "CC=#{ENV.cc}",
	 "CFLAGS=#{ENV.cflags}",
	 "LDFLAGS=#{ENV.ldflags}",
	 "OBJS=#{objs}",
	 "install"
