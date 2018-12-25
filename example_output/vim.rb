name :
	 Vim
homepage :
	 https://www.vim.org/
url :
	 https://github.com/vim/vim/archive/v8.1.0600.tar.gz
description :
	 Vi 'workalike' with many additional features
build_deps :
link_deps :
	 gettext
	 lua
	 perl
	 python
	 ruby
optional_deps :
conflicts :
	 ex-vi
	 macvim
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.prepend_path "PATH", Formula["python"].opt_libexec/"bin"
	 ENV.delete("SDKROOT")
	 ENV.delete("PYTHONPATH")
	 system "./configure", "--prefix=#{HOMEBREW_PREFIX}",
	 "--mandir=#{man}",
	 "--enable-multibyte",
	 "--with-tlib=ncurses",
	 "--enable-cscope",
	 "--enable-terminal",
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
	 bin.install_symlink "vim" => "vi"
