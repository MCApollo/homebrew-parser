name :
	 Fits
homepage :
	 https://projects.iq.harvard.edu/fits
url :
	 https://github.com/harvard-lts/fits/archive/1.2.1.tar.gz
description :
	 File Information Tool Set
build_deps :
	 ant
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 system "ant", "clean-compile-jar", "-noinput"
	 libexec.install "lib",
	 %w[tools xml],
	 Dir["*.properties"]
	 (libexec/"lib").install "lib-fits/fits-#{version}.jar"
	 inreplace "fits-env.sh" do |s|
	 s.gsub! /^FITS_HOME=.*/, "FITS_HOME=#{libexec}"
	 s.gsub! "${FITS_HOME}/lib", libexec/"lib"
