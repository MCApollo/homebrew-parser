name :
	 Batik
homepage :
	 https://xmlgraphics.apache.org/batik/
url :
	 https://www.apache.org/dist/xmlgraphics/batik/binaries/batik-bin-1.10.tar.gz
description :
	 Java-based toolkit for SVG images
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install "lib", Dir["*.jar"]
	 bin.write_jar_script libexec/"batik-rasterizer-#{version}.jar", "batik-rasterizer"
	 bin.write_jar_script libexec/"batik-#{version}.jar", "batik"
	 bin.write_jar_script libexec/"batik-ttf2svg-#{version}.jar", "batik-ttf2svg"
