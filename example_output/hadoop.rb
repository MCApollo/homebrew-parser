name :
	 Hadoop
homepage :
	 https://hadoop.apache.org/
url :
	 https://www.apache.org/dyn/closer.cgi?path=hadoop/common/hadoop-3.1.1/hadoop-3.1.1.tar.gz
description :
	 Framework for distributed processing of large data sets
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
	 yarn
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.cmd", "sbin/*.cmd", "libexec/*.cmd", "etc/hadoop/*.cmd"]
	 libexec.install %w[bin sbin libexec share etc]
	 bin.write_exec_script Dir["#{libexec}/bin/*"]
	 sbin.write_exec_script Dir["#{libexec}/sbin/*"]
	 libexec.write_exec_script Dir["#{libexec}/libexec/*.sh"]
	 chmod 0755, Dir["#{libexec}/*.sh"]
