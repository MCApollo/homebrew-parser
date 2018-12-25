name :
	 ParquetTools
homepage :
	 https://parquet.apache.org/
url :
	 https://github.com/apache/parquet-mr.git
description :
	 Apache Parquet command-line tools and utilities
build_deps :
	 maven
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 cd "parquet-tools" do
	 system "mvn", "clean", "package", "-Plocal"
	 libexec.install "target/parquet-tools-#{version}.jar"
	 bin.write_jar_script libexec/"parquet-tools-#{version}.jar", "parquet-tools"
	 end
