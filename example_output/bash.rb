name :
	 Bash
homepage :
	 https://www.gnu.org/software/bash/
url :
description :
	 Bourne-Again SHell, a UNIX command interpreter
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.append_to_cflags "-DSSH_SOURCE_BASHRC"
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
