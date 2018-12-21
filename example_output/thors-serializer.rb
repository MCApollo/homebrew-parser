name :
	 ThorsSerializer
homepage :
	 https://github.com/Loki-Astari/ThorsSerializer
url :
	 https://github.com/Loki-Astari/ThorsSerializer.git
description :
	 Declarative serialization library (JSON/YAML) for C++
build_deps :
link_deps :
	 libyaml
conflicts :
patches :
EOF_patch :
install :
	 ENV["COV"] = "gcov"
	 system "./configure", "--disable-binary",
	 "--disable-vera",
	 "--prefix=#{prefix}"
	 system "make", "install"
