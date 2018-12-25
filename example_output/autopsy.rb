name :
	 Autopsy
homepage :
	 https://www.sleuthkit.org/autopsy/index.php
url :
	 https://downloads.sourceforge.net/project/autopsy/autopsy/2.24/autopsy-2.24.tar.gz
description :
	 Graphical interface to Sleuth Kit investigation tools
build_deps :
link_deps :
	 sleuthkit
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/base/autopsy.base b/base/autopsy.base
	 index 3b3bbdc..a0d2632 100644
	 --- a/base/autopsy.base
	 +++ b/base/autopsy.base
	 @@ -1,3 +1,6 @@
	 +#!/usr/bin/perl -wT
	 +use lib '/tmp/autopsy/';
	 +use lib '/tmp/autopsy/libexec/';
	 #
install :
	 (var+"lib/autopsy").mkpath
	 mv "lib", "libexec"
	 prefix.install %w[global.css help libexec pict]
	 prefix.install Dir["*.txt"]
	 (prefix+"conf.pl").write autcfg
	 inreplace "base/autopsy.base", "/tmp/autopsy", prefix
	 inreplace "base/autopsy.base", "lib/define.pl", "#{libexec}/define.pl"
	 bin.install "base/autopsy.base" => "autopsy"
