name :
	 FormatUdf
homepage :
	 https://github.com/JElchison/format-udf
url :
	 https://github.com/JElchison/format-udf/archive/1.6.1.tar.gz
description :
	 Bash script to format a block device to UDF
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
	 bin.install "format-udf.sh" => "format-udf"
