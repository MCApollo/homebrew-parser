name :
	 Wordplay
homepage :
	 http://hsvmovies.com/static_subpages/personal_orig/wordplay/index.html
url :
	 http://hsvmovies.com/static_subpages/personal_orig/wordplay/wordplay722.tar.Z
description :
	 Anagram generator
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/5de9072/wordplay/patch-wordplay.c
EOF_patch :
install :
	 inreplace "wordplay.c", "@PREFIX@", prefix
	 system "make", "CC=#{ENV.cc}"
	 bin.install "wordplay"
	 pkgshare.install "words721.txt"
