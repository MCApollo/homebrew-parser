name :
	 Tika
homepage :
	 https://tika.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=tika/tika-app-1.19.1.jar
description :
	 Content analysis toolkit
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install "tika-app-#{version}.jar"
	 bin.write_jar_script libexec/"tika-app-#{version}.jar", "tika"
	 libexec.install resource("server")
	 bin.write_jar_script libexec/"tika-server-#{version}.jar", "tika-rest-server"
