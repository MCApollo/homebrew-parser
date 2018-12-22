name :
	 Nethack
homepage :
	 https://www.nethack.org/
url :
	 https://www.nethack.org/download/3.6.1/nethack-361-src.tgz
description :
	 Single-player roguelike video game
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 cd "sys/unix" do
	 if MacOS.version >= :yosemite
	 hintfile = "macosx10.10"
	 elsif MacOS.version >= :lion
	 hintfile = "macosx10.7"
	 else
	 hintfile = "macosx10.5"
	 end
	 inreplace "hints/#{hintfile}",
	 /^HACKDIR=.*/,
	 "HACKDIR=#{libexec}"
	 system "sh", "setup.sh", "hints/#{hintfile}"
	 end
	 inreplace "sys/unix/sysconf",
	 /^WIZARDS=.*/,
	 "WIZARDS=*"
	 system "make", "install"
	 bin.install "src/nethack"
	 (libexec+"save").mkpath
	 man6.install "doc/nethack.6"
	 chmod "g+w", libexec
	 chmod "g+w", libexec+"save"
