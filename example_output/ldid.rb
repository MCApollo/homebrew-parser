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
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 inreplace "make.sh" do |s|
	 s.gsub! %r{^.*/Applications/Xcode-5.1.1.app.*}, ""
	 s.gsub! "-mmacosx-version-min=10.4", "-mmacosx-version-min=#{MacOS.version}"
	 s.gsub! "for arch in i386 x86_64; do", "for arch in x86_64; do" if MacOS.version >= :mojave
	 end
	 system "./make.sh"
	 bin.install "ldid"
	 end
	 test do
	 (testpath/"test.c").write <<~EOS
	 int main(int argc, char **argv) { return 0; }
	 EOS
	 system ENV.cc, "test.c", "-o", "test"
	 system bin/"ldid", "-S", "test"
	 end
