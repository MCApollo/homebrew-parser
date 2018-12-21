name :
	 Id3lib
homepage :
	 https://id3lib.sourceforge.io/
url :
description :
	 ID3 tag manipulation
build_deps :
	 autoconf
	 automake
	 libtool
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/e223e971/id3lib/id3lib-main.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/e223e971/id3lib/no-iomanip.h.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/e223e971/id3lib/automake.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/e223e971/id3lib/boolcheck.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/e223e971/id3lib/patch_id3lib_3.8.3_UTF16_writing_bug.diff
EOF_patch :
install :
	 system "autoreconf", "-fvi"
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
