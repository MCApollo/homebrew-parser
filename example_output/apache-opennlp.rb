name :
	 ApacheOpennlp
homepage :
	 https://opennlp.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=opennlp/opennlp-1.9.0/apache-opennlp-1.9.0-bin.tar.gz
description :
	 Machine learning toolkit for processing natural language text
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
	 libexec.install Dir["*"]
	 bin.write_exec_script libexec/"bin/opennlp"
