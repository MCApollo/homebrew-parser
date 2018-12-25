name :
	 Global
homepage :
	 https://www.gnu.org/software/global/
url :
	 https://ftp.gnu.org/gnu/global/global-6.6.2.tar.gz
description :
	 Source code tag system
build_deps :
link_deps :
	 ctags
	 python
optional_deps :
conflicts :
resource :
	 ['Pygments']
	 ['https://files.pythonhosted.org/packages/71/2a/2e4e77803a8bd6408a2903340ac498cb0a2181811af7c9ec92cb70b0308a/Pygments-2.2.0.tar.gz']
patches :
EOF_patch :
install :
	 system "sh", "reconf.sh" if build.head?
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 pygments_args = %W[build install --prefix=#{libexec}]
	 resource("Pygments").stage { system "python3", "setup.py", *pygments_args }
	 args = %W[
	 --disable-dependency-tracking
	 --prefix=#{prefix}
	 --sysconfdir=#{etc}
	 --with-exuberant-ctags=#{Formula["ctags"].opt_bin}/ctags
	 ]
	 system "./configure", *args
	 system "make", "install"
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
	 etc.install "gtags.conf"
	 cd share/"gtags" do
	 rm %w[README COPYING LICENSE INSTALL ChangeLog AUTHORS]
	 end
