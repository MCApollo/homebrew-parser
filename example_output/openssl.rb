name :
	 Openssl
homepage :
	 https://openssl.org/
url :
	 https://www.openssl.org/source/openssl-1.0.2q.tar.gz
description :
	 SSL/TLS cryptography library
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.delete("PERL")
	 ENV.delete("PERL5LIB")
	 if MacOS.prefer_64_bit?
	 arch = Hardware::CPU.arch_64_bit
	 else
	 arch = Hardware::CPU.arch_32_bit
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
	 openssldir.mkpath
	 if MacOS.version <= :snow_leopard
	 resource("ca-bundle").stage do
	 openssldir.install "cacert-#{resource("ca-bundle").version}.pem" => "cert.pem"
	 end
	 else
	 (openssldir/"cert.pem").atomic_write(valid_certs.join("\n"))
