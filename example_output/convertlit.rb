name :
	 Convertlit
homepage :
	 http://www.convertlit.com/
url :
	 http://www.convertlit.com/clit18src.zip
description :
	 Convert Microsoft Reader format eBooks into open format
build_deps :
link_deps :
	 libtommath
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "clit18/Makefile" do |s|
	 s.gsub! "-I ../libtommath-0.30", "#{HOMEBREW_PREFIX}/include"
	 s.gsub! "../libtommath-0.30/libtommath.a", "#{HOMEBREW_PREFIX}/lib/libtommath.a"
	 end
	 system "make", "-C", "lib"
	 system "make", "-C", "clit18"
	 bin.install "clit18/clit"
