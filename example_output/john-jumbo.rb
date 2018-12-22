name :
	 JohnJumbo
homepage :
	 https://www.openwall.com/john/
url :
	 https://openwall.com/john/j/john-1.8.0-jumbo-1.tar.xz
description :
	 Enhanced version of john, a UNIX password cracker
build_deps :
	 pkg-config
link_deps :
	 gmp
	 openssl
conflicts :
	 john
patches :
	 https://github.com/magnumripper/JohnTheRipper/commit/d29ad8aabaa9726eb08f440001c37611fa072e0c.diff?full_index=1
EOF_patch :
	 --- a/src/params.h	2012-08-30 13:24:18.000000000 -0500
	 +++ b/src/params.h	2012-08-30 13:25:13.000000000 -0500
	 @@ -70,15 +70,15 @@
	 * notes above.
	 */
	 #ifndef JOHN_SYSTEMWIDE
	 -#define JOHN_SYSTEMWIDE			0
	 +#define JOHN_SYSTEMWIDE			1
	 #endif
	 #if JOHN_SYSTEMWIDE
	 #ifndef JOHN_SYSTEMWIDE_EXEC /* please refer to the notes above */
	 -#define JOHN_SYSTEMWIDE_EXEC		"/usr/libexec/john"
	 +#define JOHN_SYSTEMWIDE_EXEC		"HOMEBREW_PREFIX/share/john"
	 #endif
	 #ifndef JOHN_SYSTEMWIDE_HOME
	 -#define JOHN_SYSTEMWIDE_HOME		"/usr/share/john"
	 +#define JOHN_SYSTEMWIDE_HOME		"HOMEBREW_PREFIX/share/john"
	 #endif
	 #define JOHN_PRIVATE_HOME		"~/.john"
	 #endif
install :
	 cd "src" do
	 args = []
	 if build.bottle?
	 args << "--disable-native-tests" << "--disable-native-macro"
	 end
	 system "./configure", *args
	 system "make", "clean"
	 system "make", "-s", "CC=#{ENV.cc}"
