name :
	 Igv
homepage :
	 https://www.broadinstitute.org/software/igv
url :
	 https://data.broadinstitute.org/igv/projects/downloads/2.4/IGV_2.4.14.zip
description :
	 Interactive Genomics Viewer
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 inreplace "igv.sh", /^prefix=.*/, "prefix=#{libexec}"
	 libexec.install "igv.sh", "lib"
	 (bin/"igv").write_env_script libexec/"igv.sh", Language::Java.java_home_env("1.8")
