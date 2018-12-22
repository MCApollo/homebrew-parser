name :
	 Supervisor
homepage :
	 http://supervisord.org/
url :
	 https://github.com/Supervisor/supervisor/archive/3.3.4.tar.gz
description :
	 Process Control System
build_deps :
link_deps :
	 python@2
conflicts :
patches :
EOF_patch :
install :
	 inreplace buildpath/"supervisor/skel/sample.conf" do |s|
	 s.gsub! %r{/tmp/supervisor\.sock}, var/"run/supervisor.sock"
	 s.gsub! %r{/tmp/supervisord\.log}, var/"log/supervisord.log"
	 s.gsub! %r{/tmp/supervisord\.pid}, var/"run/supervisord.pid"
	 s.gsub! /^;\[include\]$/, "[include]"
	 s.gsub! %r{^;files = relative/directory/\*\.ini$}, "files = #{etc}/supervisor.d/*.ini"
	 end
	 virtualenv_install_with_resources
	 etc.install buildpath/"supervisor/skel/sample.conf" => "supervisord.ini"
	 (var/"run").mkpath
	 (var/"log").mkpath
