name :
	 Gradle
homepage :
	 https://www.gradle.org/
url :
	 https://services.gradle.org/distributions/gradle-5.0-all.zip
description :
	 Open-source build automation tool based on the Groovy and Kotlin DSL
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
	 rm_f Dir["bin/*.bat"]
	 libexec.install %w[bin lib]
	 libexec.install %w[docs media samples src] if build.with? "all"
	 (bin/"gradle").write_env_script libexec/"bin/gradle", Language::Java.overridable_java_home_env
