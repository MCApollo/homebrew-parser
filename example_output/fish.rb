name :
	 Fish
homepage :
	 https://fishshell.com
url :
	 https://github.com/fish-shell/fish-shell/releases/download/2.7.1/fish-2.7.1.tar.gz
description :
	 User-friendly command-line shell for UNIX-like operating systems
build_deps :
link_deps :
	 pcre2
conflicts :
patches :
EOF_patch :
install :
	 if build.head?
	 args = %W[
	 -Dextra_functionsdir=#{HOMEBREW_PREFIX}/share/fish/vendor_functions.d
	 -Dextra_completionsdir=#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d
	 -Dextra_confdir=#{HOMEBREW_PREFIX}/share/fish/vendor_conf.d
	 -DSED=/usr/bin/sed
	 ]
	 system "cmake", ".", *std_cmake_args, *args
	 else
	 args = %W[
	 --prefix=#{prefix}
	 --with-extra-functionsdir=#{HOMEBREW_PREFIX}/share/fish/vendor_functions.d
	 --with-extra-completionsdir=#{HOMEBREW_PREFIX}/share/fish/vendor_completions.d
	 --with-extra-confdir=#{HOMEBREW_PREFIX}/share/fish/vendor_conf.d
	 SED=/usr/bin/sed
	 ]
	 system "./configure", *args
	 (pkgshare/"vendor_functions.d").mkpath
	 (pkgshare/"vendor_completions.d").mkpath
	 (pkgshare/"vendor_conf.d").mkpath
