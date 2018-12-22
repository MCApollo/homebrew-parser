name :
	 Nuxeo
homepage :
	 https://nuxeo.github.io/
url :
	 https://cdn.nuxeo.com/nuxeo-10.3/nuxeo-server-10.3-tomcat.zip
description :
	 Enterprise Content Management
build_deps :
link_deps :
	 exiftool
	 ghostscript
	 imagemagick
	 libwpd
	 poppler
	 ufraw
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["#{buildpath}/*"]
	 (bin/"nuxeoctl").write_env_script "#{libexec}/bin/nuxeoctl",
	 :NUXEO_HOME => libexec.to_s, :NUXEO_CONF => "#{etc}/nuxeo.conf"
	 inreplace "#{libexec}/bin/nuxeo.conf" do |s|
	 s.gsub! /#nuxeo\.log\.dir.*/, "nuxeo.log.dir=#{var}/log/nuxeo"
	 s.gsub! /#nuxeo\.data\.dir.*/, "nuxeo.data.dir=#{var}/lib/nuxeo/data"
	 s.gsub! /#nuxeo\.pid\.dir.*/, "nuxeo.pid.dir=#{var}/run/nuxeo"
	 end
	 etc.install "#{libexec}/bin/nuxeo.conf"
	 (var/"log/nuxeo").mkpath
	 (var/"lib/nuxeo/data").mkpath
	 (var/"run/nuxeo").mkpath
	 (var/"cache/nuxeo/packages").mkpath
	 libexec.install_symlink var/"cache/nuxeo/packages"
