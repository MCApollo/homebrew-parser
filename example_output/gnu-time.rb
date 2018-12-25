name :
	 GnuTime
homepage :
	 https://www.gnu.org/software/time/
url :
	 https://ftp.gnu.org/gnu/time/time-1.9.tar.gz
description :
	 GNU implementation of time utility
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 args = [
	 "--prefix=#{prefix}",
	 "--mandir=#{man}",
	 "--info=#{info}",
	 ]
	 args << "--program-prefix=g" if build.without? "default-names"
	 system "./configure", *args
	 system "make", "install"
	 if build.without? "default-names"
	 (libexec/"gnubin").install_symlink bin/"gtime" => "time"
	 end
