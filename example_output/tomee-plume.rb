name :
	 TomeePlume
homepage :
	 https://tomee.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=tomee/tomee-1.7.4/apache-tomee-1.7.4-plume.tar.gz
description :
	 Apache TomEE Plume
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 rm_rf Dir["bin/*.bat"]
	 rm_rf Dir["bin/*.bat.original"]
	 rm_rf Dir["bin/*.exe"]
	 prefix.install %w[NOTICE LICENSE RELEASE-NOTES RUNNING.txt]
	 libexec.install Dir["*"]
	 bin.install_symlink "#{libexec}/bin/startup.sh" => "tomee-plume-startup"
