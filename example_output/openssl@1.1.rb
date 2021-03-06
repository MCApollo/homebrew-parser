name :
	 OpensslAT11
homepage :
	 https://openssl.org/
url :
	 https://www.openssl.org/source/openssl-1.1.1a.tar.gz
description :
	 Cryptography and SSL/TLS Toolkit
build_deps :
link_deps :
	 perl
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV.delete("OPENSSL_LOCAL_CONFIG_DIR")
	 if which("perl") == Formula["perl"].opt_bin/"perl"
	 ENV["PERL"] = Formula["perl"].opt_bin/"perl"
	 end
	 if MacOS.prefer_64_bit?
	 arch_args = %w[darwin64-x86_64-cc enable-ec_nistp_64_gcc_128]
	 else
	 arch_args = %w[darwin-i386-cc]
	 end
	 ENV.deparallelize
	 system "perl", "./Configure", *(configure_args + arch_args)
	 system "make"
	 system "make", "test"
	 system "make", "install", "MANDIR=#{man}", "MANSUFFIX=ssl"
	 keychains = %w[
	 /System/Library/Keychains/SystemRootCertificates.keychain
	 ]
	 certs_list = `security find-certificate -a -p #{keychains.join(" ")}`
	 certs = certs_list.scan(
	 /-----BEGIN CERTIFICATE-----.*?-----END CERTIFICATE-----/m,
	 )
	 valid_certs = certs.select do |cert|
	 IO.popen("#{bin}/openssl x509 -inform pem -checkend 0 -noout >/dev/null", "w") do |openssl_io|
	 openssl_io.write(cert)
	 openssl_io.close_write
	 end
	 $CHILD_STATUS.success?
	 end
	 openssldir.mkpath
	 (openssldir/"cert.pem").atomic_write(valid_certs.join("\n"))
