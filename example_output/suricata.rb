name :
	 Suricata
homepage :
	 https://suricata-ids.org/
url :
	 https://www.openinfosecfoundation.org/download/suricata-4.0.5.tar.gz
description :
	 Network IDS, IPS, and security monitoring engine
build_deps :
	 pkg-config
link_deps :
	 jansson
	 libmagic
	 libnet
	 libyaml
	 nspr
	 nss
	 pcre
	 python
optional_deps :
conflicts :
resource :
	 ['argparse', 'simplejson']
	 ['https://files.pythonhosted.org/packages/source/a/argparse/argparse-1.4.0.tar.gz', 'https://files.pythonhosted.org/packages/source/s/simplejson/simplejson-3.16.0.tar.gz']
patches :
EOF_patch :
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 jansson = Formula["jansson"]
	 libnet = Formula["libnet"]
	 libmagic = Formula["libmagic"]
	 args = %W[
	 --disable-dependency-tracking
	 --disable-silent-rules
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}
	 --localstatedir=#{var}
	 --with-libjansson-includes=#{jansson.opt_include}
	 --with-libjansson-libraries=#{jansson.opt_lib}
	 --with-libmagic-includes=#{libmagic.opt_include}
	 --with-libmagic-libraries=#{libmagic.opt_lib}
	 --with-libnet-includes=#{libnet.opt_include}
	 --with-libnet-libs=#{libnet.opt_lib}
	 ]
	 system "./configure", *args
	 system "make", "install-full"
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
	 inreplace etc/"suricata/suricata.yaml", %r{magic-file: /.+/magic}, "magic-file: #{libmagic.opt_share}/misc/magic"
