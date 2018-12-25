name :
	 Bsdsfv
homepage :
	 https://bsdsfv.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/bsdsfv/bsdsfv/1.18/bsdsfv-1.18.tar.gz
description :
	 SFV utility tools
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 --- a/bsdsfv.c	2012-09-25 07:31:03.000000000 -0500
	 +++ b/bsdsfv.c	2012-09-25 07:31:08.000000000 -0500
	 @@ -44,5 +44,5 @@
	 typedef struct sfvtable {
	 char filename[FNAMELEN];
	 -	int crc;
	 +	unsigned int crc;
	 int found;
	 } SFVTABLE;
install :
	 bin.mkpath
	 inreplace "Makefile" do |s|
	 s.change_make_var! "INSTALL_PREFIX", prefix
	 s.change_make_var! "INDENT", "indent"
	 s.gsub! "	${INSTALL_PROGRAM} bsdsfv ${INSTALL_PREFIX}/bin", "	${INSTALL_PROGRAM} bsdsfv #{bin}/"
	 end
	 system "make", "all"
	 system "make", "install"
