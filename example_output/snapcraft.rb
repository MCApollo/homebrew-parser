name :
	 Snapcraft
homepage :
	 https://snapcraft.io/
url :
	 https://files.pythonhosted.org/packages/fc/c6/d3a59d1f08c0b8bc3d166bc6e0a26a29dd61627d2e6266bd81b26fc02142/snapcraft-3.0.1.tar.gz
description :
	 Package any app for every Linux desktop, server, cloud or device
build_deps :
link_deps :
	 libsodium
	 libyaml
	 lxc
	 python
	 squashfs
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
