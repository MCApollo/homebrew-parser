name :
	 Automysqlbackup
homepage :
	 https://sourceforge.net/projects/automysqlbackup/
url :
	 https://downloads.sourceforge.net/project/automysqlbackup/AutoMySQLBackup/AutoMySQLBackup%20VER%203.0/automysqlbackup-v3.0_rc6.tar.gz
description :
	 Automate MySQL backups
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
	 inreplace "automysqlbackup" do |s|
	 s.gsub! "/etc", etc
	 s.gsub! "/var", var
	 end
	 inreplace "automysqlbackup.conf", "/var", var
	 conf_path = (etc/"automysqlbackup")
	 conf_path.install "automysqlbackup.conf" unless (conf_path/"automysqlbackup.conf").exist?
	 sbin.install "automysqlbackup"
