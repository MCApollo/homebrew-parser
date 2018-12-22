name :
	 Jhiccup
homepage :
	 https://www.azul.com/jhiccup/
url :
	 https://www.azul.com/files/jHiccup-2.0.9-dist.zip
description :
	 Measure pauses and stalls of an app's Java runtime platform
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 bin.install "jHiccup", "jHiccupLogProcessor"
	 (bin+"jHiccupPlotter").write <<~EOS
	 #!/bin/sh
	 TMPFILE="/tmp/jHiccupPlotter.$$.xls"
	 cp "#{prefix}/jHiccupPlotter.xls" $TMPFILE
	 open $TMPFILE
	 EOS
	 prefix.install "jHiccup.jar"
	 prefix.install "jHiccupPlotter.xls"
	 inreplace "#{bin}/jHiccup" do |s|
	 s.gsub! /^JHICCUP_JAR_FILE=.*$/,
	 "JHICCUP_JAR_FILE=#{prefix}/jHiccup.jar"
	 end
