name :
	 TrezorAgent
homepage :
	 https://github.com/romanz/trezor-agent
url :
	 https://files.pythonhosted.org/packages/16/0f/077ff482453b92ad78736fe63cdb8050351f0fefa734eb0d0c4ebcbae4e0/trezor_agent-0.9.3.tar.gz
description :
	 Hardware-based SSH/GPG agent
build_deps :
link_deps :
	 libusb
	 python
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
