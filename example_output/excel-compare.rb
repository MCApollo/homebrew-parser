name :
	 ExcelCompare
homepage :
	 https://github.com/na-ka-na/ExcelCompare
url :
	 https://github.com/na-ka-na/ExcelCompare/releases/download/0.6.1/ExcelCompare-0.6.1.zip
description :
	 Command-line tool (and API) for diffing Excel Workbooks
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install Dir["bin/dist/*"]
	 (bin/"excel_cmp").write <<~EOS
	 #!/bin/sh
	 java -ea -Xmx512m -cp "#{libexec}/*" com.ka.spreadsheet.diff.SpreadSheetDiffer "$@"
	 EOS
