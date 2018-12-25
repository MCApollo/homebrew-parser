name :
	 MitScheme
homepage :
	 https://www.gnu.org/software/mit-scheme/
url :
	 https://ftp.gnu.org/gnu/mit-scheme/stable.pkg/9.2/mit-scheme-c-9.2.tar.gz
description :
	 MIT/GNU Scheme development tools and runtime library
build_deps :
	 :xcode
link_deps :
	 openssl
optional_deps :
	 :x11
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["HOMEBREW_OPTFLAGS"] = "-march=#{Hardware.oldest_cpu}" unless build.bottle?
	 ENV.deparallelize
	 cd "src"
	 %w[
	 6001/edextra.scm
	 6001/floppy.scm
	 compiler/etc/disload.scm
	 edwin/techinfo.scm
	 edwin/unix.scm
	 swat/c/tk3.2-custom/Makefile
	 swat/c/tk3.2-custom/tcl/Makefile
	 swat/scheme/other/btest.scm
	 ].each do |f|
	 inreplace f, "/usr/local", prefix
	 end
	 inreplace "microcode/configure" do |s|
	 s.gsub! "/usr/local", prefix
	 s.gsub! /SDK=MacOSX\${MACOSX}$/, "SDK=MacOSX#{MacOS.sdk.version}"
	 end
	 if build.without? "x11"
	 inreplace "etc/make-liarc.sh" do |s|
	 s.gsub! "run_configure", "run_configure --without-x"
	 end
	 end
	 system "etc/make-liarc.sh", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
