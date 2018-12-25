name :
	 StanfordCorenlp
homepage :
	 https://stanfordnlp.github.io/CoreNLP/
url :
	 https://nlp.stanford.edu/software/stanford-corenlp-full-2018-02-27.zip
description :
	 Java suite of core NLP tools
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 bin.write_exec_script Dir["#{libexec}/*.sh"]
