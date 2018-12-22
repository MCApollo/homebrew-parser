name :
	 MinimalRacket
homepage :
	 https://racket-lang.org/
url :
	 https://mirror.racket-lang.org/installers/7.0/racket-minimal-7.0-src-builtpkgs.tgz
description :
	 Modern programming language in the Lisp/Scheme family
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 cd "src" do
	 args = %W[
	 --disable-debug
	 --disable-dependency-tracking
	 --enable-macprefix
	 --prefix=#{prefix}
	 --man=#{man}
	 --sysconfdir=#{etc}
	 ]
	 args << "--disable-mac64" unless MacOS.prefer_64_bit?
	 system "./configure", *args
	 system "make"
	 system "make", "install"
	 end
	 inreplace etc/"racket/config.rktd" do |s|
	 s.gsub!(
	 /\(bin-dir\s+\.\s+"#{Regexp.quote(bin)}"\)/,
	 "(bin-dir . \"#{HOMEBREW_PREFIX}/bin\")",
	 )
	 s.gsub!(
	 /\n\)$/,
	 "\n      (default-scope . \"installation\")\n)",
	 )
	 end
