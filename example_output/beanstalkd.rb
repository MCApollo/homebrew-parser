name :
	 Beanstalkd
homepage :
	 https://beanstalkd.github.io/
url :
	 https://github.com/beanstalkd/beanstalkd/archive/v1.10.tar.gz
description :
	 Generic work queue originally designed to reduce web latency
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
	 system "make", "install", "PREFIX=#{prefix}"
