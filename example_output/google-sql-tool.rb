name :
	 GoogleSqlTool
homepage :
	 https://cloud.google.com/sql/docs/mysql-client
url :
	 https://dl.google.com/cloudsql/tools/google_sql_tool.zip
description :
	 Command-line tool for executing common SQL statements
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 chmod 0755, "google_sql.sh"
	 inreplace "google_sql.sh", 'SQL_SH_DIR="$(cd $(dirname $0); pwd)"',
	 "SQL_SH_DIR=\"#{libexec}\""
	 libexec.install %w[google_sql.sh google_sql.jar]
	 bin.install_symlink libexec/"google_sql.sh" => "google_sql"
