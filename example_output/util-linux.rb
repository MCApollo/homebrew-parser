name :
	 UtilLinux
homepage :
	 https://github.com/karelzak/util-linux
url :
	 https://www.kernel.org/pub/linux/utils/util-linux/v2.32/util-linux-2.32.1.tar.xz
description :
	 Collection of Linux utilities
build_deps :
link_deps :
conflicts :
	 rename
patches :
EOF_patch :
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--disable-ipcs",
	 "--disable-ipcrm",
	 "--disable-wall",
	 "--disable-libuuid",
	 "--disable-libsmartcols"
	 system "make", "install"
	 %w[cal col colcrt colrm getopt hexdump logger nologin look mesg more renice rev ul whereis].each do |prog|
	 rm_f bin/prog
	 rm_f sbin/prog
	 rm_f man1/"#{prog}.1"
	 rm_f man8/"#{prog}.8"
	 rm_f share/"bash-completion/completions/#{prog}"
	 end
	 Pathname.glob("bash-completion/*") do |prog|
	 if (bin/prog.basename).exist? || (sbin/prog.basename).exist?
	 bash_completion.install prog
	 end
