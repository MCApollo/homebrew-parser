name :
	 Aspectj
homepage :
	 https://eclipse.org/aspectj/
url :
	 https://www.eclipse.org/downloads/download.php?r=1&file=/tools/aspectj/aspectj-1.9.2.jar
description :
	 Aspect-oriented programming for Java
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
	 mkdir_p "#{libexec}/#{name}"
	 system "java", "-jar", "aspectj-#{version}.jar", "-to", "#{libexec}/#{name}"
	 bin.install Dir["#{libexec}/#{name}/bin/*"]
	 bin.env_script_all_files(libexec/"#{name}/bin", Language::Java.java_home_env("1.8"))
	 chmod 0555, Dir["
