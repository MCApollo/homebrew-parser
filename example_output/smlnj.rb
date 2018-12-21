name :
	 Smlnj
homepage :
	 https://www.smlnj.org/
url :
	 http://smlnj.cs.uchicago.edu/dist/working/110.84/config.tgz
description :
	 Standard ML of New Jersey
build_deps :
link_deps :
	 :maximum_macos
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 ENV.m32
	 root = prefix/"SMLNJ_HOME"
	 root.mkpath
	 cp_r buildpath, root/"config"
	 rm root/"config/targets"
	 (root/"config/targets").write targets
	 %w[cm compiler runtime system].each do |name|
	 resource(name).stage { cp_r pwd, root/"base" }
