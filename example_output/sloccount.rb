name :
	 Sloccount
homepage :
	 https://www.dwheeler.com/sloccount/
url :
	 https://www.dwheeler.com/sloccount/sloccount-2.26.tar.gz
description :
	 Count lines of code in many languages
build_deps :
link_deps :
	 md5sha1sum
conflicts :
patches :
EOF_patch :
	 diff --git a/break_filelist b/break_filelist
	 index ad2de47..ff854e0 100755
	 --- a/break_filelist
	 +++ b/break_filelist
	 @@ -205,6 +205,7 @@ $noisy = 0;
	 "hs" => "haskell", "lhs" => "haskell",
	 "jsp" => "jsp",
	 +  "erl" => "erlang",
	 );
install :
	 rm "makefile.orig"
	 bin.mkpath
	 system "make", "install", "PREFIX=#{prefix}"
	 (bin+"erlang_count").write "#!/bin/sh\ngeneric_count '%' $@"
