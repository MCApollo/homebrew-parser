name :
	 Minidlna
homepage :
	 https://sourceforge.net/projects/minidlna/
url :
	 https://downloads.sourceforge.net/project/minidlna/minidlna/1.2.1/minidlna-1.2.1.tar.gz
description :
	 Media server software, compliant with DLNA/UPnP-AV clients
build_deps :
link_deps :
	 ffmpeg
	 flac
	 jpeg
	 libexif
	 libid3tag
	 libogg
	 libvorbis
	 sqlite
conflicts :
patches :
EOF_patch :
install :
	 system "./autogen.sh" if build.head?
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
	 (pkgshare/"minidlna.conf").write <<~EOS
	 friendly_name=Mac DLNA Server
	 media_dir=#{ENV["HOME"]}/.config/minidlna/media
	 db_dir=#{ENV["HOME"]}/.config/minidlna/cache
	 log_dir=#{ENV["HOME"]}/.config/minidlna
	 EOS
