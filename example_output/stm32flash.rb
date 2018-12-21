name :
	 Stm32flash
homepage :
	 https://sourceforge.net/projects/stm32flash/
url :
	 https://downloads.sourceforge.net/project/stm32flash/stm32flash-0.5.tar.gz
description :
	 Open source flash program for STM32 using the ST serial bootloader
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 system "make", "PREFIX=#{prefix}", "install"
