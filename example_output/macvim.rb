name :
	 Macvim
homepage :
	 https://github.com/macvim-dev/macvim
url :
	 https://github.com/macvim-dev/macvim/archive/snapshot-153.tar.gz
description :
	 GUI for vim, made for macOS
build_deps :
	 :xcode
link_deps :
	 cscope
	 lua
	 python
conflicts :
	 vim
patches :
EOF_patch :
install :
	 if MacOS.version == :sierra || MacOS.version == :yosemite
	 ENV.delete("SDKROOT")
	 end
	 ENV.delete("PYTHONPATH")
	 ENV.clang if MacOS.version >= :lion
	 system "./configure", "--with-features=huge",
	 "--enable-multibyte",
	 "--with-macarchs=#{MacOS.preferred_arch}",
	 "--enable-perlinterp",
	 "--enable-rubyinterp",
	 "--enable-tclinterp",
	 "--enable-terminal",
	 "--with-tlib=ncurses",
	 "--with-compiledby=Homebrew",
	 "--with-local-dir=#{HOMEBREW_PREFIX}",
	 "--enable-cscope",
	 "--enable-luainterp",
	 "--with-lua-prefix=#{Formula["lua"].opt_prefix}",
	 "--enable-luainterp",
	 "--enable-python3interp"
	 system "make"
	 prefix.install "src/MacVim/build/Release/MacVim.app"
	 bin.install_symlink prefix/"MacVim.app/Contents/bin/mvim"
	 executables = %w[mvimdiff mview mvimex gvim gvimdiff gview gvimex]
	 executables += %w[vi vim vimdiff view vimex]
	 executables.each { |e| bin.install_symlink "mvim" => e }
