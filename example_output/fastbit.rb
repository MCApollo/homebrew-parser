name :
	 Fastbit
homepage :
	 https://sdm.lbl.gov/fastbit/
url :
	 https://code.lbl.gov/frs/download.php/file/426/fastbit-2.0.3.tar.gz
description :
	 Open-source data processing library in NoSQL spirit
build_deps :
link_deps :
	 :java
conflicts :
	 iniparser
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/fe9d4e5/fastbit/xcode9.patch
EOF_patch :
install :
	 ENV.cxx11
	 system "./configure", "--disable-debug",
	 "--disable-dependency-tracking",
	 "--prefix=#{prefix}"
	 system "make", "install"
	 libexec.install lib/"fastbitjni.jar"
	 bin.write_jar_script libexec/"fastbitjni.jar", "fastbitjni"
