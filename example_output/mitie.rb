name :
	 Mitie
homepage :
	 https://github.com/mit-nlp/MITIE/
url :
	 https://github.com/mit-nlp/MITIE/archive/v0.6.tar.gz
description :
	 Library and tools for information extraction
build_deps :
link_deps :
	 python@2
optional_deps :
conflicts :
resource :
	 ['models-english']
	 ['https://downloads.sourceforge.net/project/mitie/binaries/MITIE-models-v0.2.tar.bz2']
patches :
EOF_patch :
install :
	 (share/"MITIE-models").install resource("models-english")
	 inreplace "mitielib/makefile", "libmitie.so", "libmitie.dylib"
	 system "make", "mitielib"
	 system "make"
	 include.install Dir["mitielib/include/*"]
	 lib.install "mitielib/libmitie.dylib", "mitielib/libmitie.a"
	 (lib/"python2.7/site-packages").install "mitielib/mitie.py"
	 pkgshare.install "examples", "sample_text.txt",
	 "sample_text.reference-output", "sample_text.reference-output-relations"
	 bin.install "ner_example", "ner_stream", "relation_extraction_example"
