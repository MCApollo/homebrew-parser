name :
	 Mallet
homepage :
	 http://mallet.cs.umass.edu/
url :
	 http://mallet.cs.umass.edu/dist/mallet-2.0.8.tar.gz
description :
	 MAchine Learning for LanguagE Toolkit
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 ['testdata']
	 ['https://raw.githubusercontent.com/mimno/Mallet/master/sample-data/stackexchange/tsv/testing.tsv']
patches :
EOF_patch :
install :
	 rm Dir["bin/*.{bat,dll,exe}"]
	 libexec.install Dir["*"]
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env)
