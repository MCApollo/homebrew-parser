name :
	 Ykman
homepage :
	 https://developers.yubico.com/yubikey-manager/
url :
	 https://developers.yubico.com/yubikey-manager/Releases/yubikey-manager-1.0.1.tar.gz
description :
	 Tool for managing your YubiKey configuration
build_deps :
	 swig
link_deps :
	 libusb
	 openssl
	 python
	 ykpers
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
