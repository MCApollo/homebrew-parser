name :
	 Sbcl
homepage :
	 http://www.sbcl.org/
url :
	 https://downloads.sourceforge.net/project/sbcl/sbcl/1.4.13/sbcl-1.4.13-source.tar.bz2
description :
	 Steel Bank Common Lisp system
build_deps :
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/c5ffdb11/sbcl/patch-make-doc.diff
EOF_patch :
install :
	 ENV.delete_if do |_, value|
	 ascii_val = value.dup
	 ascii_val.force_encoding("ASCII-8BIT") if ascii_val.respond_to? :force_encoding
	 ascii_val =~ /[\x80-\xff]/n
