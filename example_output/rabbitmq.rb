name :
	 Rabbitmq
homepage :
	 https://www.rabbitmq.com
url :
	 https://github.com/rabbitmq/rabbitmq-server/releases/download/v3.7.9/rabbitmq-server-generic-unix-3.7.9.tar.xz
description :
	 Messaging broker
build_deps :
link_deps :
	 erlang
conflicts :
patches :
EOF_patch :
install :
	 prefix.install Dir["*"]
	 (var/"lib/rabbitmq").mkpath
	 (var/"log/rabbitmq").mkpath
	 erlang = Formula["erlang"]
	 inreplace sbin/"rabbitmq-defaults" do |s|
	 s.gsub! "SYS_PREFIX=${RABBITMQ_HOME}", "SYS_PREFIX=#{HOMEBREW_PREFIX}"
	 s.gsub! /^ERL_DIR=$/, "ERL_DIR=#{erlang.opt_bin}/"
	 s.gsub! "CLEAN_BOOT_FILE=start_clean", "CLEAN_BOOT_FILE=#{erlang.opt_lib/"erlang/bin/start_clean"}"
	 s.gsub! "SASL_BOOT_FILE=start_sasl", "SASL_BOOT_FILE=#{erlang.opt_lib/"erlang/bin/start_clean"}"
	 end
	 inreplace sbin/"rabbitmq-env",
	 'RABBITMQ_HOME="$(rmq_realpath "${RABBITMQ_SCRIPTS_DIR}/..")"',
	 "RABBITMQ_HOME=#{prefix}"
	 rabbitmq_env_conf = etc/"rabbitmq/rabbitmq-env.conf"
	 rabbitmq_env_conf.write rabbitmq_env unless rabbitmq_env_conf.exist?
	 enabled_plugins_path = etc/"rabbitmq/enabled_plugins"
	 enabled_plugins_path.write "[rabbitmq_management,rabbitmq_stomp,rabbitmq_amqp1_0,rabbitmq_mqtt]." unless enabled_plugins_path.exist?
	 system "/usr/bin/unzip", "-qq", "-j",
	 "#{prefix}/plugins/rabbitmq_management-#{version}.ez",
	 "rabbitmq_management-#{version}/priv/www/cli/rabbitmqadmin"
	 sbin.install "rabbitmqadmin"
	 (sbin/"rabbitmqadmin").chmod 0755
	 (bash_completion/"rabbitmqadmin.bash").write Utils.popen_read("#{sbin}/rabbitmqadmin --bash-completion")
