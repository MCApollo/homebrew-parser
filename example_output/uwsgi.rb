name :
	 Uwsgi
homepage :
	 https://uwsgi-docs.readthedocs.org/en/latest/
url :
description :
	 Full stack for building hosting services
build_deps :
	 pkg-config
link_deps :
	 go
	 openssl
	 pcre
	 python@2
	 yajl
	 libyaml
	 python
	 zeromq
conflicts :
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/726bff4/uwsgi/libpython-tbd-xcode-sdk.diff
EOF_patch :
install :
	 if MacOS.version == :sierra || MacOS.version == :el_capitan
	 ENV["SDKROOT"] = MacOS.sdk_path
	 end
	 ENV.append %w[CFLAGS LDFLAGS], "-arch #{MacOS.preferred_arch}"
	 openssl = Formula["openssl"]
	 ENV.prepend "CFLAGS", "-I#{openssl.opt_include}"
	 ENV.prepend "LDFLAGS", "-L#{openssl.opt_lib}"
	 yaml = build.with?("libyaml") ? "libyaml" : "embedded"
	 (buildpath/"buildconf/brew.ini").write <<~EOS
	 [uwsgi]
	 ssl = true
	 json = yajl
	 xml = libxml2
	 yaml = #{yaml}
	 inherit = base
	 plugin_dir = #{libexec}/uwsgi
	 embedded_plugins = null
	 EOS
	 system "python", "uwsgiconfig.py", "--verbose", "--build", "brew"
	 plugins = %w[airbrake alarm_curl alarm_speech asyncio cache
	 carbon cgi cheaper_backlog2 cheaper_busyness
	 corerouter curl_cron cplusplus dumbloop dummy
	 echo emperor_amqp fastrouter forkptyrouter gevent
	 http logcrypto logfile ldap logpipe logsocket
	 msgpack notfound pam ping psgi pty rawrouter
	 router_basicauth router_cache router_expires
	 router_hash router_http router_memcached
	 router_metrics router_radius router_redirect
	 router_redis router_rewrite router_static
	 router_uwsgi router_xmldir rpc signal spooler
	 sqlite3 sslrouter stats_pusher_file
	 stats_pusher_socket symcall syslog
	 transformation_chunked transformation_gzip
	 transformation_offload transformation_tofile
	 transformation_toupper ugreen webdav zergpool]
	 plugins << "gccgo" if build.with? "go"
	 (libexec/"uwsgi").mkpath
	 plugins.each do |plugin|
	 system "python", "uwsgiconfig.py", "--verbose", "--plugin", "plugins/#{plugin}", "brew"
	 end
	 python_versions = {
	 "python"  => "python2.7",
	 "python2" => "python2.7",
	 }
	 python_versions["python3"] = "python3" if build.with? "python"
	 python_versions.each do |k, v|
	 system v, "uwsgiconfig.py", "--verbose", "--plugin", "plugins/python", "brew", k
	 end
	 bin.install "uwsgi"
