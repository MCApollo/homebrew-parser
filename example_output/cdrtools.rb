name :
	 Cdrtools
homepage :
	 http://cdrecord.org/
url :
	 https://downloads.sourceforge.net/project/cdrtools/cdrtools-3.01.tar.bz2
description :
	 CD/DVD/Blu-ray premastering and recording software
build_deps :
	 smake
link_deps :
optional_deps :
conflicts :
	 dvdrtools
resource :
	 []
	 []
patches :
	 https://downloads.sourceforge.net/project/cdrtools/cdrtools-3.01-fix-20151126-mkisofs-isoinfo.patch
EOF_patch :
install :
	 rm_f Dir["lib*/*_p.mk"]
	 system "smake", "INS_BASE=#{prefix}", "INS_RBASE=#{prefix}", "install"
	 (include/"schily").rmtree
	 %w[libschily.a libdeflt.a libfind.a].each do |file|
	 (lib/file).unlink
	 end
	 man5.rmtree
