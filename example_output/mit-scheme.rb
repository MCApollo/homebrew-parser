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
	 :x11
conflicts :
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
