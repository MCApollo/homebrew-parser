name :
	 ReconNg
homepage :
	 https://bitbucket.org/LaNMaSteR53/recon-ng
url :
	 https://bitbucket.org/LaNMaSteR53/recon-ng/get/v4.9.4.tar.gz
description :
	 Web Reconnaissance Framework
build_deps :
link_deps :
	 python@2
optional_deps :
conflicts :
resource :
	 ['dicttoxml', 'dnspython', 'Flask', 'jsonrpclib', 'lxml', 'mechanize', 'olefile', 'PyPDF2', 'slowaes', 'unicodecsv', 'XlsxWriter']
	 ['https://files.pythonhosted.org/packages/74/36/534db111db9e7610a41641a1f6669a964aacaf51858f466de264cc8dcdd9/dicttoxml-1.7.4.tar.gz', 'https://files.pythonhosted.org/packages/e4/96/a598fa35f8a625bc39fed50cdbe3fd8a52ef215ef8475c17cabade6656cb/dnspython-1.15.0.zip', 'https://files.pythonhosted.org/packages/4b/12/c1fbf4971fda0e4de05565694c9f0c92646223cff53f15b6eb248a310a62/Flask-1.0.2.tar.gz', 'https://files.pythonhosted.org/packages/a9/0a/69b6b794d7b086793683743df2f6d0a4fcf97613a95a39cfc74b78f2adb7/jsonrpclib-0.1.7.tar.gz', 'https://files.pythonhosted.org/packages/4b/20/ddf5eb3bd5c57582d2b4652b4bbcf8da301bdfe5d805cb94e805f4d7464d/lxml-4.2.5.tar.gz', 'https://files.pythonhosted.org/packages/ef/be/4c433dfa7703c0fa81ca3a88afe74b2b9e2b23e664479a4913ecefe7f8ca/mechanize-0.3.7.tar.gz', 'https://files.pythonhosted.org/packages/34/81/e1ac43c6b45b4c5f8d9352396a14144bba52c8fec72a80f425f6a4d653ad/olefile-0.46.zip', 'https://files.pythonhosted.org/packages/b4/01/68fcc0d43daf4c6bdbc6b33cc3f77bda531c86b174cac56ef0ffdb96faab/PyPDF2-1.26.0.tar.gz', 'https://files.pythonhosted.org/packages/79/a4/c7dcbe89ec22a6985790bc0effb12bb8caef494fbac3c2bab86ae51a53ef/slowaes-0.1a1.tar.gz', 'https://files.pythonhosted.org/packages/6f/a4/691ab63b17505a26096608cc309960b5a6bdf39e4ba1a793d5f9b1a53270/unicodecsv-0.14.1.tar.gz', 'https://files.pythonhosted.org/packages/0c/08/69581af3c4807d2b8bac47251c80343161b9f315a7f91fb703aa865302d9/XlsxWriter-1.1.2.tar.gz']
patches :
EOF_patch :
install :
	 ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra
	 libexec.install Dir["*"]
	 venv = virtualenv_create(libexec)
	 venv.pip_install resources
	 inreplace libexec/"recon-ng", "#!/usr/bin/env python", "#!#{libexec}/bin/python"
	 bin.install_symlink libexec/"recon-ng"
