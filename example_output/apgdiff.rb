name :
	 Apgdiff
homepage :
	 https://www.apgdiff.com/
url :
	 https://www.apgdiff.com/download/apgdiff-2.4-bin.zip
description :
	 Another PostgreSQL diff tool
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 jar = "apgdiff-#{version}.jar"
	 if build.head?
	 system "ant"
	 cd "dist" do
	 jar = Dir["apgdiff-*.jar"].first
	 mv jar, ".."
	 end
