name :
	 Psql2csv
homepage :
	 https://github.com/fphilipe/psql2csv
url :
	 https://github.com/fphilipe/psql2csv/archive/v0.9.tar.gz
description :
	 Run a query in psql and output the result as CSV
build_deps :
link_deps :
	 postgresql
conflicts :
patches :
EOF_patch :
install :
	 bin.install "psql2csv"
