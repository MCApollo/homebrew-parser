name :
	 Alluxio
homepage :
	 https://www.alluxio.org/
url :
	 http://downloads.alluxio.org/downloads/files/1.8.1/alluxio-1.8.1-bin.tar.gz
description :
	 Open Source Memory Speed Virtual Distributed Storage
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
	 doc.install Dir["docs/*"]
	 libexec.install Dir["*"]
	 bin.write_exec_script Dir["#{libexec}/bin/*"]
	 (etc/"alluxio").install libexec/"conf/alluxio-env.sh.template" => "alluxio-env.sh"
	 ln_sf "#{etc}/alluxio/alluxio-env.sh", "#{libexec}/conf/alluxio-env.sh"
