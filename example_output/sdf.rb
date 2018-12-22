name :
	 Sdf
homepage :
	 https://strategoxt.org/Sdf/WebHome
url :
	 http://www.meta-environment.org/releases/sdf-2.6.3.tar.gz
description :
	 Syntax Definition Formalism: high-level description of grammars
build_deps :
	 pkg-config
link_deps :
	 aterm
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 ENV.append "CFLAGS", "-std=gnu89 -fbracket-depth=1024" if ENV.compiler == :clang
	 resource("c-library").stage do
	 system "./configure", "--prefix=#{libexec}/c-library"
	 system "make", "install"
	 end
	 resource("toolbuslib").stage do
	 system "./configure", "--prefix=#{libexec}/toolbuslib"
	 system "make", "install"
	 end
	 resource("error-support").stage do
	 system "./configure", "--prefix=#{libexec}/error-support",
	 "--with-toolbuslib=#{libexec}/toolbuslib"
	 system "make", "install"
	 end
	 resource("pt-support").stage do
	 system "./configure", "--prefix=#{libexec}/pt-support",
	 "--with-toolbuslib=#{libexec}/toolbuslib",
	 "--with-error-support=#{libexec}/error-support"
	 system "make", "install"
	 end
	 resource("sdf-support").stage do
	 system "./configure", "--prefix=#{libexec}/sdf-support",
	 "--with-toolbuslib=#{libexec}/toolbuslib",
	 "--with-error-support=#{libexec}/error-support",
	 "--with-pt-support=#{libexec}/pt-support"
	 system "make", "install"
	 end
	 resource("asf-support").stage do
	 system "./configure", "--prefix=#{libexec}/asf-support",
	 "--with-error-support=#{libexec}/error-support",
	 "--with-pt-support=#{libexec}/pt-support"
	 system "make", "install"
	 end
	 resource("tide-support").stage do
	 system "./configure", "--prefix=#{libexec}/tide-support",
	 "--with-toolbuslib=#{libexec}/toolbuslib"
	 system "make", "install"
	 end
	 resource("rstore-support").stage do
	 system "./configure", "--prefix=#{libexec}/rstore-support",
	 "--with-toolbuslib=#{libexec}/toolbuslib"
	 system "make", "install"
	 end
	 resource("config-support").stage do
	 system "./configure", "--prefix=#{libexec}/config-support"
	 system "make", "install"
	 end
	 resource("ptable-support").stage do
	 system "./configure", "--prefix=#{libexec}/ptable-support",
	 "--with-pt-support=#{libexec}/pt-support"
	 system "make", "install"
	 end
	 resource("sglr").stage do
	 system "./configure", "--prefix=#{libexec}/sglr",
	 "--with-toolbuslib=#{libexec}/toolbuslib",
	 "--with-error-support=#{libexec}/error-support",
	 "--with-pt-support=#{libexec}/pt-support",
	 "--with-ptable-support=#{libexec}/ptable-support",
	 "--with-config-support=#{libexec}/config-support",
	 "--with-c-library=#{libexec}/c-library"
	 system "make", "install"
	 end
	 resource("asc-support").stage do
	 system "./configure", "--prefix=#{libexec}/asc-support",
	 "--with-toolbuslib=#{libexec}/toolbuslib",
	 "--with-error-support=#{libexec}/error-support",
	 "--with-pt-support=#{libexec}/pt-support",
	 "--with-ptable-support=#{libexec}/ptable-support",
	 "--with-config-support=#{libexec}/config-support",
	 "--with-c-library=#{libexec}/c-library",
	 "--with-tide-support=#{libexec}/tide-support",
	 "--with-rstore-support=#{libexec}/rstore-support",
	 "--with-asf-support=#{libexec}/asf-support",
	 "--with-rstore-support=#{libexec}/rstore-support",
	 "--with-sglr=#{libexec}/sglr"
	 system "make", "install"
	 end
	 resource("pgen").stage do
	 system "./configure", "--prefix=#{libexec}/pgen",
	 "--with-toolbuslib=#{libexec}/toolbuslib",
	 "--with-error-support=#{libexec}/error-support",
	 "--with-pt-support=#{libexec}/pt-support",
	 "--with-ptable-support=#{libexec}/ptable-support",
	 "--with-config-support=#{libexec}/config-support",
	 "--with-c-library=#{libexec}/c-library",
	 "--with-sglr=#{libexec}/sglr",
	 "--with-sdf-support=#{libexec}/sdf-support",
	 "--with-asc-support=#{libexec}/asc-support"
	 system "make", "install"
	 end
	 resource("pandora").stage do
	 system "./configure", "--prefix=#{libexec}/pandora",
	 "--with-toolbuslib=#{libexec}/toolbuslib",
	 "--with-pt-support=#{libexec}/pt-support",
	 "--with-asc-support=#{libexec}/asc-support"
	 system "make", "install"
	 end
	 system "./configure", "--prefix=#{prefix}",
	 "--with-sglr=#{libexec}/sglr",
	 "--with-pgen=#{libexec}/pgen",
	 "--with-pandora=#{libexec}/pandora"
	 system "make", "install"
