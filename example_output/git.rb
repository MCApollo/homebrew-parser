name :
	 Git
homepage :
	 https://git-scm.com
url :
	 https://www.kernel.org/pub/software/scm/git/git-2.20.1.tar.xz
description :
	 Distributed revision control system
build_deps :
link_deps :
	 gettext
	 pcre2
	 openssl
	 curl
	 openssl
	 curl
conflicts :
patches :
EOF_patch :
install :
	 ENV["NO_FINK"] = "1"
	 ENV["NO_DARWIN_PORTS"] = "1"
	 ENV["NO_R_TO_GCC_LINKER"] = "1"
	 ENV["PYTHON_PATH"] = which("python")
	 ENV["PERL_PATH"] = which("perl")
	 ENV["USE_LIBPCRE2"] = "1"
	 ENV["INSTALL_SYMLINKS"] = "1"
	 ENV["LIBPCREDIR"] = Formula["pcre2"].opt_prefix
	 ENV["V"] = "1"
	 perl_version = Utils.popen_read("perl --version")[/v(\d+\.\d+)(?:\.\d+)?/, 1]
	 if MacOS.version >= :mavericks
	 ENV["PERLLIB_EXTRA"] = %W[
	 #{MacOS.active_developer_dir}
	 /Library/Developer/CommandLineTools
	 /Applications/Xcode.app/Contents/Developer
	 ].uniq.map do |p|
	 "#{p}/Library/Perl/#{perl_version}/darwin-thread-multi-2level"
	 end.join(":")
