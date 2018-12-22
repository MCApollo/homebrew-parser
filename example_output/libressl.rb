name :
	 Libressl
homepage :
	 https://www.libressl.org/
url :
	 https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.2.tar.gz
description :
	 Version of the SSL/TLS protocol forked from OpenSSL
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --with-openssldir=#{etc}/libressl
	 --sysconfdir=#{etc}/libressl
	 ]
	 system "./autogen.sh" if build.head?
	 system "./configure", *args
	 system "make"
	 system "make", "check"
	 system "make", "install"
	 keychains = %w[
	 /System/Library/Keychains/SystemRootCertificates.keychain
	 ]
	 certs_list = `security find-certificate -a -p #{keychains.join(" ")}`
	 certs = certs_list.scan(
	 /-----BEGIN CERTIFICATE-----.*?-----END CERTIFICATE-----/m,
	 )
	 valid_certs = certs.select do |cert|
	 IO.popen("#{bin}/openssl x509 -inform pem -checkend 0 -noout", "w") do |openssl_io|
	 openssl_io.write(cert)
	 openssl_io.close_write
	 end
	 $CHILD_STATUS.success?
	 end
	 rm_f %W[#{etc}/libressl/cert.pem #{etc}/libressl/cert.pem.default]
	 (etc/"libressl/cert.pem").atomic_write(valid_certs.join("\n"))
