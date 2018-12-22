name :
	 Twtxt
homepage :
	 https://github.com/buckket/twtxt
url :
	 https://github.com/buckket/twtxt/archive/v1.2.3.tar.gz
description :
	 Decentralised, minimalist microblogging service for hackers
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
	 diff --git a/setup.py b/setup.py
	 index 9ca33d1..05b65f3 100644
	 --- a/setup.py
	 +++ b/setup.py
	 @@ -63,8 +63,7 @@ with codecs.open(os.path.join(os.path.abspath(os.path.dirname(
	 install_requires = ['chardet', 'multidict>=4.0.0',
	 -                    'async_timeout>=1.2.0', 'yarl>=1.0.0',
	 -                    'idna-ssl>=1.0.0']
	 +                    'async_timeout>=1.2.0', 'yarl>=1.0.0']
install :
	 xy = Language::Python.major_minor_version "python3"
	 ENV.prepend_create_path "PYTHONPATH", libexec/"vendor/lib/python#{xy}/site-packages"
	 resources.each do |r|
	 r.stage do
	 system "python3", *Language::Python.setup_install_args(libexec/"vendor")
	 end
	 end
	 ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python#{xy}/site-packages"
	 system "python3", *Language::Python.setup_install_args(libexec)
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
