name :
	 SwiProlog
homepage :
	 http://www.swi-prolog.org/
url :
	 http://www.swi-prolog.org/download/stable/src/swipl-7.6.4.tar.gz
description :
	 ISO/Edinburgh-style Prolog interpreter
build_deps :
	 pkg-config
link_deps :
	 gmp
	 openssl
	 readline
	 :x11
	 jpeg
optional_deps :
	 libarchive
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if build.with? "libarchive"
	 ENV["ARPREFIX"] = Formula["libarchive"].opt_prefix
	 else
	 ENV.append "DISABLE_PKGS", "archive"
	 end
	 args = ["--prefix=#{libexec}", "--mandir=#{man}"]
	 ENV.append "DISABLE_PKGS", "jpl" if build.without? "jpl"
	 ENV.append "DISABLE_PKGS", "xpce" if build.without? "xpce"
	 ENV["CIFLAGS"] = ENV.cppflags
	 ENV["COFLAGS"] = ENV.cflags
	 system "echo 3 | ./prepare" if build.head?
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 bin.write_exec_script Dir["#{libexec}/bin/*"]
