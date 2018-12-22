name :
	 Newlisp
homepage :
	 http://www.newlisp.org/
url :
	 http://www.newlisp.org/downloads/newlisp-10.7.1.tgz
description :
	 Lisp-like, general-purpose scripting language
build_deps :
link_deps :
	 readline
conflicts :
patches :
EOF_patch :
install :
	 ENV.append_to_cflags "-DNEWCONFIG -c"
	 inreplace "guiserver/newlisp-edit.lsp" do |s|
	 s.gsub! "#!/usr/local/bin/newlisp", "#!/usr/bin/env newlisp"
	 s.gsub! "/usr/local/bin/newlisp", "#{opt_bin}/newlisp"
	 end
	 system "./configure-alt", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make"
	 system "make", "check"
	 system "make", "install"
