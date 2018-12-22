name :
	 Kettle
homepage :
	 https://community.hitachivantara.com/docs/DOC-1009931-downloads
url :
	 https://downloads.sourceforge.net/project/pentaho/Pentaho%208.1/client-tools/pdi-ce-8.1.0.0-365.zip
description :
	 Pentaho Data Integration software
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 rm_rf Dir["*.{bat}"]
	 libexec.install Dir["*"]
	 (etc+"kettle").install libexec+"pwd/carte-config-master-8080.xml" => "carte-config.xml"
	 (etc+"kettle/.kettle").install libexec+"pwd/kettle.pwd"
	 (etc+"kettle/simple-jndi").mkpath
	 (var+"log/kettle").mkpath
	 %w[carte kitchen pan].each do |command|
	 (bin+"pdi#{command}").write_env_script libexec+"#{command}.sh", :BASEDIR => libexec
	 end
