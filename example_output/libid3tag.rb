name :
	 Libid3tag
homepage :
	 https://www.underbit.com/products/mad/
url :
	 https://downloads.sourceforge.net/project/mad/libid3tag/0.15.1b/libid3tag-0.15.1b.tar.gz
description :
	 ID3 tag manipulation library
build_deps :
link_deps :
conflicts :
patches :
	 https://gitweb.gentoo.org/repo/gentoo.git/plain/media-libs/libid3tag/files/0.15.1b/libid3tag-0.15.1b-#{name}.patch?id=56bd759df1d0
	 https://gitweb.gentoo.org/repo/gentoo.git/plain/media-libs/libid3tag/files/0.15.1b/libid3tag-0.15.1b-#{name}.patch?id=56bd759df1d0
	 https://gitweb.gentoo.org/repo/gentoo.git/plain/media-libs/libid3tag/files/0.15.1b/libid3tag-0.15.1b-a_capella.patch?id=56bd759df1d0
EOF_patch :
install :
	 system "./configure", "--prefix=#{prefix}", "--disable-debug", "--disable-dependency-tracking"
	 system "make", "install"
	 (lib+"pkgconfig/id3tag.pc").write pc_file
