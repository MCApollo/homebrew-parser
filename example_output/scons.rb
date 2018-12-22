name :
	 Scons
homepage :
	 https://www.scons.org/
url :
	 https://downloads.sourceforge.net/project/scons/scons/3.0.1/scons-3.0.1.tar.gz
description :
	 Substitute for classic 'make' tool with autoconf/automake functionality
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 man1.install gzip("scons-time.1", "scons.1", "sconsign.1")
	 system "/usr/bin/python", "setup.py", "install",
	 "--prefix=#{prefix}",
	 "--standalone-lib",
	 "--install-lib=#{libexec}/scons-local",
	 "--install-scripts=#{bin}",
	 "--install-data=#{libexec}",
	 "--no-version-script", "--no-install-man"
	 bin.children.each do |p|
	 mv p, "#{libexec}/#{p.basename}.py"
	 bin.install_symlink "#{libexec}/#{p.basename}.py" => p.basename
	 end
