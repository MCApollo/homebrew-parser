name :
	 GitIf
homepage :
	 https://ifarchive.org/indexes/if-archiveXprogrammingXglulxXinterpretersXgit.html
url :
	 https://ifarchive.org/if-archive/programming/glulx/interpreters/git/git-135.zip
description :
	 Glulx interpreter that is optimized for speed
build_deps :
	 glktermw
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 glk = Formula["glktermw"]
	 inreplace "Makefile", "GLK = cheapglk", "GLK = #{glk.name}"
	 inreplace "Makefile", "GLKINCLUDEDIR = ../$(GLK)", "GLKINCLUDEDIR = #{glk.include}"
	 inreplace "Makefile", "GLKLIBDIR = ../$(GLK)", "GLKLIBDIR = #{glk.lib}"
	 inreplace "Makefile", /^OPTIONS = /, "OPTIONS = -DUSE_MMAP -DUSE_INLINE"
	 system "make"
	 bin.install "git" => "git-if"
