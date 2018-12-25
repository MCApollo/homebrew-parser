name :
	 Cvs
homepage :
	 https://www.nongnu.org/cvs/
url :
	 https://ftp.gnu.org/non-gnu/cvs/source/feature/1.12.13/cvs-1.12.13.tar.bz2
description :
	 Version control system
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://opensource.apple.com/tarballs/cvs/cvs-45.tar.gz
	 https://raw.githubusercontent.com/Homebrew/formula-patches/24118ec737c7/cvs/vasnprintf-high-sierra-fix.diff
EOF_patch :
install :
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--infodir=#{info}",
	 "--mandir=#{man}",
	 "--sysconfdir=#{etc}",
	 "--with-gssapi",
	 "--enable-pam",
	 "--enable-encryption",
	 "--with-external-zlib",
	 "--enable-case-sensitivity",
	 "--with-editor=vim",
	 "ac_cv_func_working_mktime=no"
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
