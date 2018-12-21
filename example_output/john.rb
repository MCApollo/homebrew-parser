name :
	 John
homepage :
	 https://www.openwall.com/john/
url :
	 https://www.openwall.com/john/j/john-1.8.0.tar.xz
description :
	 Featureful UNIX password cracker
build_deps :
link_deps :
conflicts :
	 john-jumbo
patches :
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
	 ENV.deparallelize
	 arch = MacOS.prefer_64_bit? ? "64" : "sse2"
	 target = "macosx-x86-#{arch}"
	 system "make", "-C", "src", "clean", "CC=#{ENV.cc}", target
	 rm "README"
	 prefix.install "doc/README"
	 doc.install Dir["doc/*"]
	 libexec.install Dir["run/*"]
	 bin.install_symlink libexec/"john"
	 mv libexec/"john.conf", libexec/"john.ini"
