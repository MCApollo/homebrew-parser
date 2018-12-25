name :
	 Vcs
homepage :
	 https://p.outlyer.net/vcs/
url :
	 https://p.outlyer.net/vcs/files/vcs-1.13.2.tar.gz
description :
	 Creates video contact sheets (previews) of videos
build_deps :
link_deps :
	 ffmpeg
	 ghostscript
	 gnu-getopt
	 imagemagick
optional_deps :
	 mplayer
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "vcs", "declare GETOPT=getopt", "declare GETOPT=#{Formula["gnu-getopt"].opt_bin}/getopt"
	 system "make", "install", "prefix=#{prefix}"
