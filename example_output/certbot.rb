name :
	 Certbot
homepage :
	 https://certbot.eff.org/
url :
	 https://github.com/certbot/certbot/archive/v0.29.1.tar.gz
description :
	 Tool to obtain certs from Let's Encrypt and autoenable HTTPS
build_deps :
link_deps :
	 augeas
	 dialog
	 openssl
	 python
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_install_with_resources
	 %w[acme certbot-apache certbot-nginx].each do |r|
	 venv.pip_install buildpath/r
