name :
	 Cbmbasic
homepage :
	 https://github.com/mist64/cbmbasic
url :
	 https://downloads.sourceforge.net/project/cbmbasic/cbmbasic/1.0/cbmbasic-1.0.tgz
description :
	 Commodore BASIC V2 as a scripting language
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 system "make", "CFLAGS=#{ENV.cflags}", "LDFLAGS=#{ENV.ldflags}"
	 bin.install "cbmbasic"
