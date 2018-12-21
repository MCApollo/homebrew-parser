name :
	 Ldid
homepage :
	 https://cydia.saurik.com/info/ldid/
url :
	 https://git.saurik.com/ldid.git
description :
	 Lets you manipulate the signature block in a Mach-O binary
build_deps :
link_deps :
	 openssl
conflicts :
patches :
EOF_patch :
install :
	 inreplace "make.sh" do |s|
	 s.gsub! %r{^.*/Applications/Xcode-5.1.1.app.*}, ""
	 s.gsub! "-mmacosx-version-min=10.4", "-mmacosx-version-min=#{MacOS.version}"
	 s.gsub! "for arch in i386 x86_64; do", "for arch in x86_64; do" if MacOS.version >= :mojave
