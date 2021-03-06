name :
	 Gnutls
homepage :
	 https://gnutls.org/
url :
	 https://gnupg.org/ftp/gcrypt/gnutls/v3.5/gnutls-3.5.19.tar.xz
description :
	 GNU Transport Layer Security (TLS) Library
build_deps :
	 pkg-config
link_deps :
	 gmp
	 libtasn1
	 libunistring
	 nettle
	 p11-kit
optional_deps :
	 guile
	 unbound
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 if MacOS.version == "10.11" && MacOS::Xcode.installed? && MacOS::Xcode.version >= "8.0"
	 inreplace "configure", "getentropy(0, 0);", "undefinedgibberish(0, 0);"
	 end
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --disable-static
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}
	 --with-default-trust-store-file=#{etc}/openssl/cert.pem
	 --disable-heartbeat-support
	 ]
	 if build.with? "p11-kit"
	 args << "--with-p11-kit"
	 else
	 args << "--without-p11-kit"
	 end
	 if build.with? "guile"
	 args << "--enable-guile" << "--with-guile-site-dir"
	 else
	 args << "--disable-guile"
	 end
	 system "./configure", *args
	 system "make", "install"
	 mv bin/"certtool", bin/"gnutls-certtool"
	 mv man1/"certtool.1", man1/"gnutls-certtool.1"
	 keychains = %w[
	 /System/Library/Keychains/SystemRootCertificates.keychain
	 ]
	 certs_list = `security find-certificate -a -p #{keychains.join(" ")}`
	 certs = certs_list.scan(/-----BEGIN CERTIFICATE-----.*?-----END CERTIFICATE-----/m)
	 valid_certs = certs.select do |cert|
	 IO.popen("openssl x509 -inform pem -checkend 0 -noout", "w") do |openssl_io|
	 openssl_io.write(cert)
	 openssl_io.close_write
	 end
	 $CHILD_STATUS.success?
	 end
	 openssldir = etc/"openssl"
	 openssldir.mkpath
	 (openssldir/"cert.pem").atomic_write(valid_certs.join("\n"))
