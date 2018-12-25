name :
	 StanfordParser
homepage :
	 https://nlp.stanford.edu/software/lex-parser.shtml
url :
	 https://nlp.stanford.edu/software/stanford-parser-full-2018-02-27.zip
description :
	 Statistical NLP parser
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
