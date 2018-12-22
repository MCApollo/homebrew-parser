name :
	 StanfordNer
homepage :
	 https://nlp.stanford.edu/software/CRF-NER.shtml
url :
	 https://nlp.stanford.edu/software/stanford-ner-2018-02-27.zip
description :
	 Stanford NLP Group's implementation of a Named Entity Recognizer
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 bin.write_exec_script Dir["#{libexec}/*.sh"]
