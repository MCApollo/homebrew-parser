name :
	 Mp3fs
homepage :
	 https://khenriks.github.io/mp3fs/
url :
	 https://github.com/khenriks/mp3fs/releases/download/v0.91/mp3fs-0.91.tar.gz
description :
	 Read-only FUSE file system: transcodes audio formats to MP3
build_deps :
	 pkg-config
link_deps :
	 flac
	 lame
	 libid3tag
	 :osxfuse
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
