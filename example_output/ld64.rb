name :
	 Ld64
homepage :
	 https://opensource.apple.com/
url :
	 https://opensource.apple.com/tarballs/ld64/ld64-97.17.tar.gz
description :
	 Updated version of the ld shipped by Apple
build_deps :
	 cctools-headers
	 dyld-headers
	 libunwind-headers
link_deps :
	 :maximum_macos
	 openssl
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/3b073fca/ld64/ld64-97-ppc-branch-island.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/3b073fca/ld64/ld64-97-no-LTO.patch
	 https://raw.githubusercontent.com/Homebrew/formula-patches/3b073fca/ld64/ld64-version.patch
EOF_patch :
install :
	 buildpath.install resource("makefile")
	 mv "Makefile-97", "Makefile"
	 inreplace "src/ld/Options.cpp", "@@VERSION@@", version
	 args = %W[
	 CC=#{ENV.cc}
	 CXX=#{ENV.cxx}
	 OTHER_CPPFLAGS=#{ENV.cppflags}
	 OTHER_LDFLAGS=#{ENV.ldflags}
	 ]
	 args << 'RC_SUPPORTED_ARCHS="armv6 armv7 i386 x86_64"' if MacOS.version >= :lion
	 inreplace "Makefile" do |s|
	 s.change_make_var! "CFLAGS", ENV.cflags
	 s.change_make_var! "CXXFLAGS", ENV.cxxflags
