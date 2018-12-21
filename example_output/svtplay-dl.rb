name :
	 SvtplayDl
homepage :
	 https://svtplay-dl.se/
url :
	 https://files.pythonhosted.org/packages/1f/95/5ef43ad627206dbfbca43e377a855a37aa8d005f136ff43974ba6b30fd3e/svtplay-dl-2.1.tar.gz
description :
	 Download videos from https://www.svtplay.se/
build_deps :
link_deps :
	 openssl
	 python
	 rtmpdump
conflicts :
patches :
EOF_patch :
install :
	 virtualenv_install_with_resources
