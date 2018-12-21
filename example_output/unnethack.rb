name :
	 Unnethack
homepage :
	 https://sourceforge.net/projects/unnethack/
url :
	 https://downloads.sourceforge.net/project/unnethack/unnethack/5.1.0/unnethack-5.1.0-20131208.tar.gz
description :
	 Fork of Nethack
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 version_specific_directory = "#{var}/unnethack/#{version}"
	 args = [
	 "--prefix=#{prefix}",
	 "--with-owner=#{`id -un`}",
	 "--with-group=admin",
	 "--enable-xlogfile=#{var}/unnethack/xlogfile",
	 "--with-bonesdir=#{version_specific_directory}/bones",
	 "--with-savesdir=#{version_specific_directory}/saves",
	 "--enable-wizmode=#{`id -un`}",
	 ]
	 system "./configure", *args
	 ENV.deparallelize
	 system "make", "install", "CHGRP=#"
