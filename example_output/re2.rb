name :
	 Re2
homepage :
	 https://github.com/google/re2
url :
	 https://github.com/google/re2/archive/2018-12-01.tar.gz
description :
	 Alternative to backtracking PCRE-style regular expression engines
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.cxx11
	 system "make", "install", "prefix=#{prefix}"
	 MachO::Tools.change_dylib_id("#{lib}/libre2.0.0.0.dylib", "#{lib}/libre2.0.dylib")
	 lib.install_symlink "libre2.0.0.0.dylib" => "libre2.0.dylib"
	 lib.install_symlink "libre2.0.0.0.dylib" => "libre2.dylib"
