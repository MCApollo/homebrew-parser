name :
	 NifiRegistry
homepage :
	 https://nifi.apache.org/registry
url :
	 https://www.apache.org/dyn/closer.lua?path=/nifi/nifi-registry/nifi-registry-0.3.0/nifi-registry-0.3.0-bin.tar.gz
description :
	 Centralized storage & management of NiFi/MiNiFi shared resources
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 rm Dir[libexec/"bin/*.bat"]
	 bin.install libexec/"bin/nifi-registry.sh" => "nifi-registry"
	 bin.env_script_all_files libexec/"bin/", :NIFI_REGISTRY_HOME => libexec
