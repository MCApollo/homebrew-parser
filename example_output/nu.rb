name :
	 Nu
homepage :
	 https://github.com/nulang/nu
url :
	 https://github.com/nulang/nu/archive/v2.2.2.tar.gz
description :
	 Object-oriented, Lisp-like programming language
build_deps :
link_deps :
	 :macos
	 pcre
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.delete("SDKROOT") if MacOS.version < :sierra
	 ENV["PREFIX"] = prefix
	 inreplace "Nukefile" do |s|
	 s.gsub!('(SH "sudo ', '(SH "')
	 s.gsub!("\#{@destdir}/Library/Frameworks", "\#{@prefix}/Frameworks")
	 s.sub! /^;; source files$/, <<~EOS
	 ;; source files
	 (set @framework_install_path "#{frameworks}")
	 EOS
	 end
	 system "make"
	 system "./mininush", "tools/nuke"
	 bin.mkdir
	 lib.mkdir
	 include.mkdir
	 system "./mininush", "tools/nuke", "install"
