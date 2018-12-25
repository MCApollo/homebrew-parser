name :
	 Exomizer
homepage :
	 https://bitbucket.org/magli143/exomizer/wiki/Home
url :
	 https://bitbucket.org/magli143/exomizer/wiki/downloads/exomizer-3.0.1.zip
description :
	 6502 compressor with CBM PET 4032 support
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
	 cd "src" do
	 system "make"
	 bin.install %w[exobasic exomizer]
	 end
