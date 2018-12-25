name :
	 Timidity
homepage :
	 https://timidity.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/timidity/TiMidity++/TiMidity++-2.14.0/TiMidity++-2.14.0.tar.bz2
description :
	 Software synthesizer
build_deps :
link_deps :
	 flac
	 libao
	 libogg
	 libvorbis
	 speex
optional_deps :
conflicts :
resource :
	 ['freepats']
	 ['https://freepats.zenvoid.org/freepats-20060219.zip']
patches :
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--enable-audio=darwin,vorbis,flac,speex,ao"
	 system "make", "install"
	 (share/"freepats").install resource("freepats")
	 pkgshare.install_symlink share/"freepats/Tone_000",
	 share/"freepats/Drum_000",
	 share/"freepats/freepats.cfg" => "timidity.cfg"
