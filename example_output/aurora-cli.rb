name :
	 AuroraCli
homepage :
	 https://aurora.apache.org
url :
	 https://www.apache.org/dyn/closer.cgi?path=/aurora/0.21.0/apache-aurora-0.21.0.tar.gz
description :
	 Apache Aurora Scheduler Client
build_deps :
link_deps :
	 python@2
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 ENV["PANTS_BINARIES_PATH_BY_ID"] = "{('darwin','15'):('mac','10.11'),('darwin','16'):('mac','10.12'),('darwin','17'):('mac','10.13'),('darwin','18'):('mac','10.13')}"
	 system "./pants", "binary", "src/main/python/apache/aurora/kerberos:kaurora"
	 system "./pants", "binary", "src/main/python/apache/aurora/kerberos:kaurora_admin"
	 bin.install "dist/kaurora.pex" => "aurora"
	 bin.install "dist/kaurora_admin.pex" => "aurora_admin"
