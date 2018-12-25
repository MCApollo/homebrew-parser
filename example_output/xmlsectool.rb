name :
	 Xmlsectool
homepage :
	 https://wiki.shibboleth.net/confluence/display/XSTJ2/xmlsectool+V2+Home
url :
	 https://shibboleth.net/downloads/tools/xmlsectool/latest/xmlsectool-2.0.0-bin.zip
description :
	 Check schema validity and signature of an XML document
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
	 prefix.install "doc/LICENSE.TXT"
	 rm_rf "doc"
	 libexec.install Dir["*"]
	 (bin/"xmlsectool").write_env_script "#{libexec}/xmlsectool.sh", Language::Java.java_home_env
