name :
	 Ripmime
homepage :
	 https://pldaniels.com/ripmime/
url :
	 https://pldaniels.com/ripmime/ripmime-1.4.0.10.tar.gz
description :
	 Extract attachments out of MIME encoded email packages
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
	 system "make", "LIBS=-liconv", "CFLAGS=#{ENV.cflags}"
	 bin.install "ripmime"
	 man1.install "ripmime.1"
