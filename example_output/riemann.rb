name :
	 Riemann
homepage :
	 http://riemann.io
url :
	 https://github.com/riemann/riemann/releases/download/0.3.1/riemann-0.3.1.tar.bz2
description :
	 Event stream processor
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 etc.install "etc/riemann.config" => "riemann.config.guide"
	 libexec.install Dir["*"]
	 (bin+"riemann").write shim_script
