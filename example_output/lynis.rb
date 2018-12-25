name :
	 Lynis
homepage :
	 https://cisofy.com/lynis/
url :
	 https://downloads.cisofy.com/lynis/lynis-2.7.0.tar.gz
description :
	 Security and system auditing tool to harden systems
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
	 inreplace "lynis" do |s|
	 s.gsub! 'tINCLUDE_TARGETS="/usr/local/include/lynis ' \
	 '/usr/local/lynis/include /usr/share/lynis/include ./include"',
	 %Q(tINCLUDE_TARGETS="#{include}")
	 s.gsub! 'tPLUGIN_TARGETS="/usr/local/lynis/plugins ' \
	 "/usr/local/share/lynis/plugins /usr/share/lynis/plugins " \
	 '/etc/lynis/plugins ./plugins"',
	 %Q(tPLUGIN_TARGETS="#{prefix}/plugins")
	 s.gsub! 'tDB_TARGETS="/usr/local/share/lynis/db /usr/local/lynis/db ' \
	 '/usr/share/lynis/db ./db"',
	 %Q(tDB_TARGETS="#{prefix}/db")
	 end
	 inreplace "include/functions" do |s|
	 s.gsub! 'tPROFILE_TARGETS="/usr/local/etc/lynis /etc/lynis ' \
	 '/usr/local/lynis ."',
	 %Q(tPROFILE_TARGETS="#{prefix}")
	 end
	 prefix.install "db", "include", "plugins", "default.prf"
	 bin.install "lynis"
	 man8.install "lynis.8"
