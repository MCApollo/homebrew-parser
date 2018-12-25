name :
	 Nifi
homepage :
	 https://nifi.apache.org
url :
	 https://www.apache.org/dyn/closer.cgi?path=/nifi/1.8.0/nifi-1.8.0-bin.tar.gz
description :
	 Easy to use, powerful, and reliable system to process and distribute data
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
	 ENV["NIFI_HOME"] = libexec
	 bin.install libexec/"bin/nifi.sh" => "nifi"
	 bin.env_script_all_files libexec/"bin/", :NIFI_HOME => libexec
