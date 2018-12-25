name :
	 Primer3
homepage :
	 https://primer3.sourceforge.io/
url :
	 https://downloads.sourceforge.net/project/primer3/primer3/2.4.0/primer3-2.4.0.tar.gz
description :
	 Program for designing PCR primers
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
	 bin.install %w[primer3_core ntdpal ntthal oligotm long_seq_tm_test]
	 pkgshare.install "primer3_config"
	 end
