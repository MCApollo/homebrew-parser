name :
	 Kestrel
homepage :
	 https://twitter-archive.github.io/kestrel/
url :
	 https://twitter-archive.github.io/kestrel/download/kestrel-2.4.1.zip
description :
	 Distributed message queue
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
	 inreplace "scripts/kestrel.sh" do |s|
	 s.change_make_var! "APP_HOME", libexec
	 s.gsub! "/var", var
	 s.gsub! "Usage: /etc/init.d/${APP_NAME}.sh", "Usage: kestrel"
	 s.gsub! "ulimit -", "
	 end
	 inreplace "config/production.scala", "/var", var
	 libexec.install Dir["*"]
	 (libexec/"scripts/kestrel.sh").chmod 0755
	 (libexec/"scripts/devel.sh").chmod 0755
	 (bin/"kestrel").write <<~EOS
	 #!/bin/bash
	 exec "#{libexec}/scripts/kestrel.sh" "$@"
	 EOS
	 (var/"log/kestrel").mkpath
	 (var/"run/kestrel").mkpath
	 (var/"spool/kestrel").mkpath
