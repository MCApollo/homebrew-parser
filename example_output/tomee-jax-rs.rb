name :
	 TomeeJaxRs
homepage :
	 https://tomee.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=tomee/tomee-1.7.4/apache-tomee-1.7.4-jaxrs.tar.gz
description :
	 TomeEE Web Profile plus JAX-RS
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm_rf Dir["bin/*.bat"]
	 rm_rf Dir["bin/*.bat.original"]
	 rm_rf Dir["bin/*.exe"]
	 prefix.install %w[NOTICE LICENSE RELEASE-NOTES RUNNING.txt]
	 libexec.install Dir["*"]
	 bin.install_symlink "#{libexec}/bin/startup.sh" => "tomee-jax-rs-startup"
