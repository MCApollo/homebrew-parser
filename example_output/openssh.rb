name :
	 Openssh
homepage :
	 https://www.openssh.com/
url :
	 https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.9p1.tar.gz
description :
	 OpenBSD freely-licensed SSH connectivity tools
build_deps :
link_deps :
	 openssl
	 ldns
	 pkg-config
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/patches/1860b0a74/openssh/patch-sandbox-darwin.c-apple-sandbox-named-external.diff
	 https://raw.githubusercontent.com/Homebrew/patches/d8b2d8c2/openssh/patch-sshd.c-apple-sandbox-named-external.diff
EOF_patch :
install :
	 ENV.append "CPPFLAGS", "-D__APPLE_SANDBOX_NAMED_EXTERNAL__"
	 inreplace "sandbox-darwin.c", "@PREFIX@/share/openssh", etc/"ssh"
	 args = %W[
	 --with-libedit
	 --with-kerberos5
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}/ssh
	 --with-pam
	 --with-ssl-dir=#{Formula["openssl"].opt_prefix}
	 ]
	 args << "--with-ldns" if build.with? "ldns"
	 system "./configure", *args
	 system "make"
	 ENV.deparallelize
	 system "make", "install"
	 bin.install_symlink bin/"ssh" => "slogin"
	 buildpath.install resource("com.openssh.sshd.sb")
	 (etc/"ssh").install "com.openssh.sshd.sb" => "org.openssh.sshd.sb"
