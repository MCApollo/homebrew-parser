name :
	 Chcase
homepage :
	 http://www.primaledge.ca/chcase.html
url :
	 http://www.primaledge.ca/chcase
description :
	 Perl file-renaming script
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/chcase b/chcase
	 index 689fc79..93efae8
	 --- a/chcase
	 +++ b/chcase
	 @@ -1,3 +1,4 @@
	 +
	 eval 'exec perl $0 ${1+"$@"}'
	 if 0;
install :
	 bin.install "chcase"
