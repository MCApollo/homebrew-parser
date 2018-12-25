name :
	 Payara
homepage :
	 https://www.payara.fish
url :
	 https://search.maven.org/remotecontent?filepath=fish/payara/distributions/payara/5.183/payara-5.183.zip
description :
	 Java EE application server forked from GlassFish
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
	 glassfish
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm_f Dir["**/*.{bat,exe}"]
	 inreplace "bin/asadmin", /AS_INSTALL=.*/,
	 "AS_INSTALL=#{libexec}/glassfish"
	 libexec.install Dir["*"]
	 bin.install Dir["#{libexec}/bin/*"]
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
