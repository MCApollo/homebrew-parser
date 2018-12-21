name :
	 Fdclone
homepage :
	 https://hp.vector.co.jp/authors/VA012337/soft/fd/
url :
	 http://www.unixusers.net/src/fdclone/FD-3.01h.tar.gz
description :
	 Console-based file manager
build_deps :
	 nkf
link_deps :
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/86107cf/fdclone/3.01b.patch
EOF_patch :
install :
	 ENV.deparallelize
	 system "make", "PREFIX=#{prefix}", "all"
	 system "make", "MANTOP=#{man}", "install"
	 %w[README FAQ HISTORY LICENSES TECHKNOW ToAdmin].each do |file|
	 system "nkf", "-w", "--overwrite", file
	 prefix.install "#{file}.eng" => file
	 prefix.install file => "#{file}.ja"
