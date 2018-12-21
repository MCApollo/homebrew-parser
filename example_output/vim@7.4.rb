name :
	 VimAT74
homepage :
	 https://www.vim.org/
url :
	 https://github.com/vim/vim/archive/v7.4.2367.tar.gz
description :
	 Vi 'workalike' with many additional features
build_deps :
link_deps :
	 lua
	 perl
	 python
	 ruby
conflicts :
patches :
EOF_patch :
	 diff --git a/src/if_python3.c b/src/if_python3.c
	 index 02d913492c..59c115dd8d 100644
	 --- a/src/if_python3.c
	 +++ b/src/if_python3.c
	 @@ -34,11 +34,6 @@
	 #include <limits.h>
	 -/* Python.h defines _POSIX_THREADS itself (if needed) */
	 -#ifdef _POSIX_THREADS
	 -
	 -#endif
	 -
	 #if defined(_WIN32) && defined(HAVE_FCNTL_H)
	 #endif
install :
	 ENV.prepend_path "PATH", Formula["python"].opt_libexec/"bin"
	 ENV.delete("SDKROOT")
	 ENV["LUA_PREFIX"] = HOMEBREW_PREFIX if build.with?("lua") || build.with?("luajit")
	 ENV.delete("PYTHONPATH")
	 system "./configure", "--prefix=#{HOMEBREW_PREFIX}",
	 "--mandir=#{man}",
	 "--enable-multibyte",
	 "--with-tlib=ncurses",
	 "--enable-cscope",
	 "--with-compiledby=Homebrew",
	 "--enable-perlinterp",
	 "--enable-rubyinterp",
	 "--enable-python3interp",
	 "--enable-gui=no",
	 "--without-x",
	 "--enable-luainterp",
	 "--with-lua-prefix=#{Formula["lua"].opt_prefix}"
	 system "make"
	 ENV.deparallelize
	 system "make", "install", "prefix=#{prefix}", "STRIP=#{which "true"}"
	 bin.install_symlink "vim" => "vi" if build.with? "override-system-vi"
