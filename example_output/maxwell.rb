name :
	 Maxwell
homepage :
	 http://maxwells-daemon.io/
url :
	 https://github.com/zendesk/maxwell/releases/download/v1.19.2/maxwell-1.19.2.tar.gz
description :
	 Maxwell's daemon, a mysql-to-json kafka producer
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
	 %w[maxwell maxwell-bootstrap].each do |f|
	 bin.install libexec/"bin/#{f}"
	 end
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
